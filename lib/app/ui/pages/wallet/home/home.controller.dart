import 'dart:async';

import 'package:flutter/material.dart';
import 'package:clipboard/clipboard.dart';
import 'package:get/get.dart';
import 'package:plug/app/data/models/interface/interface.dart';
import 'package:plug/app/data/provider/data.account.dart';
import 'package:plug/app/data/provider/data.base-coin.dart';
import 'package:plug/app/data/provider/data.config.dart';
import 'package:plug/app/routes/routes.dart';
import 'package:plug/app/ui/components/function/bottomSheet.component.dart';
import 'package:plug/app/ui/components/function/loading.component.dart';
import 'package:plug/app/ui/components/function/toast.component.dart';
import 'package:plug/app/ui/components/view/qrcode.component.dart';
import 'package:plug/app/data/services/net.services.dart';
import 'package:plug/app/ui/components/view/update.dart';
import 'package:plug/app/ui/utils/global_init.dart';
import 'package:plug/app/ui/utils/number.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class BasicHomePageState {
  // 消息提醒
  final Rx<bool> _hadNewsTip = false.obs;
  bool get hadNewsTip => _hadNewsTip.value;
  set hadNewsTip(bool value) => _hadNewsTip.value = value;

  // 账户列表
  final RxList<AccountModel> accountList = RxList<AccountModel>();

  // 侧边栏选中账户
  final Rx<String> _drawerSelected = ''.obs;
  String get drawerSelected => _drawerSelected.value;
  set drawerSelected(String value) => _drawerSelected.value = value;

  // 当前账户
  final Rx<AccountModel> _accountInfo = AccountModel().obs;
  AccountModel get accountInfo => _accountInfo.value;
  set accountInfo(AccountModel value) => _accountInfo.value = value;

  // 账户主网币价值
  final Rx<String> _accountAssetsToken = ''.obs;
  String get accountAssetsToken => _accountAssetsToken.value;
  set accountAssetsToken(String value) => _accountAssetsToken.value = value;

  // 账户价值
  final Rx<String> _accountAssetsPrice = ''.obs;
  String get accountAssetsPrice => _accountAssetsPrice.value;
  set accountAssetsPrice(String value) => _accountAssetsPrice.value = value;

  // 是否隐藏余额
  final Rx<bool> _hideInfo = false.obs;
  bool get hideInfo => _hideInfo.value;
  set hideInfo(bool value) => _hideInfo.value = value;

  // 盒子高度比例0-100
  final Rx<double> _infoBoxHeightScale = 100.0.obs;
  double get infoBoxHeightScale => _infoBoxHeightScale.value;
  set infoBoxHeightScale(double value) => _infoBoxHeightScale.value = value;

  // 提示备份显示内容
  final RxList<Widget> tipBackupView = RxList<Widget>();

  // 桌面侧滑的key
  final Rx<GlobalKey<ScaffoldState>> _scaffoldKey =
      GlobalKey<ScaffoldState>().obs;
  GlobalKey<ScaffoldState> get scaffoldKey => _scaffoldKey.value;
  set scaffoldKey(GlobalKey<ScaffoldState> value) => _scaffoldKey.value = value;
}

class BasicHomePageController extends GetxController
    with GetTickerProviderStateMixin {
  BasicHomePageController();

  RefreshController accountRefreshController = RefreshController();

  final DataAccountController dataAccountController = Get.find();
  final DataCoinsController dataCoinsController = Get.find();
  final DataConfigController dataAppConfig = Get.find();

  BasicHomePageState state = BasicHomePageState();

  late Animation<double> _infoAnimation;
  late AnimationController? _infoAnimationController;
  bool close = false;

  Timer? _timer;

  @override
  onReady() {
    super.onReady();
    _checkDeepLink();
    _hideInit();
    initAccountStorage();
    _initAnimationController();
    _checkBackup();
    // 检查更新
    CheckUpdateApp().checkVersion(() {});
  }

  @override
  onClose() {
    _timer?.cancel();
    _infoAnimationController?.dispose();
    _infoAnimationController = null;
    close = true;
  }

  // 判断是否有深度链接
  _checkDeepLink() async {
    String? _link = UtilGlobalInit.getDeepLink;
    if (_link != null) {
      UtilGlobalInit.getDeepLink = null;
      await Future.delayed(const Duration(microseconds: 500));
      Get.toNamed(_link);
    }
  }

  // 初始化显示隐藏
  _hideInit() async {
    await Future.delayed(const Duration(milliseconds: 10));
    onInfoHide(type: dataAppConfig.state.config.homeValueHide);
  }

  // 获取当前账户信息
  Future<void> initAccountStorage() async {
    await _checkAndInsertAccountBaseCoin();
    LLoading.showLoading();
    var result = await Future.wait<dynamic>(state.accountInfo.tokenList
        .map<Future<dynamic>>((token) => httpToolApp.getAccountBalance(
            state.accountInfo.address,
            token.type == EnumTokenType.prc10
                ? token.minUnit
                : token.contractAddress))
        .toList());
    initAllAccountTokenLogo();
    LLoading.dismiss();
    // 更改币种余额
    for (var i = 0; i < result.length; i++) {
      state.accountInfo.tokenList[i].amount = result[i]?.data ?? '';
    }
    state._accountInfo.refresh();
    _getAccountPrice();
  }

  // 获取所有币种logo
  Future<void> initAllAccountTokenLogo() async {
    var result = await httpToolServer.getTokenLogo(state.accountInfo.tokenList
        .map((e) =>
            e.type == EnumTokenType.prc10 ? e.minUnit : e.contractAddress)
        .toList());
    if (result.status != 0 || result.data is! List) return;
    for (var i = 0; i < result.data.length; i++) {
      state.accountInfo.tokenList[i].logo = result.data[i] ?? '';
    }
  }

  // 判断账户内是否有重复代币，如果有进行删除
  AccountModel _checkAndRemoveAccountRepeatCoin(AccountModel account) {
    List<TokenModel> tokenList = [];
    for (var token in account.tokenList) {
      var isRepeat = tokenList.where((_memToken) {
        if (token.type == EnumTokenType.prc20) {
          if (_memToken.contractAddress == token.contractAddress) return true;
        } else {
          if (_memToken.minUnit == token.minUnit) return true;
        }
        return false;
      }).isNotEmpty;
      if (!isRepeat) {
        tokenList.add(token);
      }
    }
    account.tokenList = tokenList;
    return account;
  }

  // 判断账户是否有基础币，如果没有加入并储存
  _checkAndInsertAccountBaseCoin() async {
    var hadBase = dataAccountController.checkAccountHadCoin(
        dataAccountController.state.nowAccount!.address,
        dataCoinsController.state.baseCoin.minUnit);
    if (!hadBase) {
      dataAccountController.updateAccount(
        dataAccountController.state.nowAccount!
          ..tokenList.insert(0, dataCoinsController.state.baseCoin),
      );
    }

    // 加入默认PUSD
    var PUSDContract = 'gx1jqulxg07n2cg8wtjkc457w650a3av3xdl5rauc';
    var hadPUSD = dataAccountController.checkAccountHadPRCCoin(
      dataAccountController.state.nowAccount!.address, PUSDContract
    );
    if (!hadPUSD) {
      var pusdRes = await httpToolServer.searchToken20Info(PUSDContract);
      TokenModel PUSD;
      if (pusdRes.status == 0) {
        PUSD = pusdRes.data['token'];
      } else {
        PUSD = localPUSDCoinInfo;
      }
      dataAccountController.updateAccount(
        dataAccountController.state.nowAccount!
          ..tokenList.insert(1, PUSD),
      );
    }

    state.accountInfo = _checkAndRemoveAccountRepeatCoin(
        dataAccountController.state.nowAccount!);
    onDrawerSelect(state.accountInfo.address);
  }

  // 获取账户价值
  _getAccountPrice() async {
    double num = 0.0;
    double tokenNum = 0.0;
    List<String> tokensList = [];
    for (var token in state.accountInfo.tokenList) {
      tokensList.add(token.type == EnumTokenType.prc20
          ? token.contractAddress
          : token.minUnit);
    }
    var result = await browserToolServer.getTokenPrice(tokensList);
    if (result == null || result.status != 0) return;
    var data = result.data;
    if (data == null || data['errno'] != 200) return;
    var priceList = data['data'];
    for (var i = 0; i < state.accountInfo.tokenList.length; i++) {
      var token = state.accountInfo.tokenList[i];
      token.price = '${priceList[i]['price']}';
      num += double.tryParse(NumberTool.numMul(
              NumberTool.amountToBalance(token.amount, scale: token.scale),
              token.price)) ??
          0;
      tokenNum += double.tryParse(NumberTool.numMul(
              NumberTool.amountToBalance(token.amount, scale: token.scale),
              '${priceList[i]['base_price']}')) ??
          0;
    }
    state._accountInfo.refresh();
    state.accountAssetsPrice =
        double.tryParse(num.toStringAsFixed(2)).toString();
    state.accountAssetsToken = double.tryParse(
            tokenNum.toStringAsFixed(state.accountInfo.tokenList.first.scale))
        .toString();
  }

  // 检查是否需要备份
  _checkBackup() async {
    await Future.delayed(const Duration(seconds: 3));
    if (close) return;
    if (state.accountInfo.createTime == null) return;
    var day = state.accountInfo.createTime?.difference(DateTime.now()).inDays;
    if (day == null || day > -3) return;
    state.accountInfo.createTime = DateTime.now();
    LBottomSheet.baseBottomSheet(
      showClose: false,
      child: state.tipBackupView[0],
      horizontalPadding: true,
    );
  }

  // 菜单
  onTapMenu() {
    state.scaffoldKey.currentState?.openDrawer();
  }

  // 消息
  goToNewsList() {
    Get.toNamed(PlugRoutesNames.walletNotification);
  }

  // 扫码
  goToScan() {
    Get.toNamed(PlugRoutesNames.walletQrScanner);
  }

  // 复制地址
  onCopyAddress({String? address}) {
    FlutterClipboard.copy(address ?? state.accountInfo.address)
        .then((value) => LToast.success('SuccessWithCopyAddress'.tr));
  }

  // 显示二维码
  onShowScan() async {
    bool _memType = state.hideInfo;
    onInfoHide(type: true);
    await LBottomSheet.baseBottomSheet(
      child: LQrCodeView(address: state.accountInfo.address),
      horizontalPadding: true,
    );
    onInfoHide(type: _memType);
  }

  // 初始化切换动画
  _initAnimationController() {
    _infoAnimationController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    _infoAnimation =
        Tween(begin: 0.0, end: 100.0).animate(_infoAnimationController!)
          ..addListener(() {
            if (state.hideInfo) {
              state.infoBoxHeightScale = 100.0 - _infoAnimation.value;
            } else {
              state.infoBoxHeightScale = _infoAnimation.value;
            }
          });
  }

  // 一键隐藏切换
  onInfoHide({bool? type}) {
    if (_infoAnimationController == null) _initAnimationController();
    if (_infoAnimation.value != 0.0 && _infoAnimation.value != 100.0) return;
    if (type == null) {
      state._hideInfo.toggle();
    } else {
      if (state.hideInfo == type) return;
      state.hideInfo = type;
    }
    dataAppConfig.upHomeHide(state.hideInfo);
    _infoAnimationController?.forward(from: 0.0);
  }

  // 添加代币
  onAddToken() async {
    await Get.toNamed(PlugRoutesNames.walletTokenList);
    initAccountStorage();
  }

  // 我的代币详情
  onToTokenPage(TokenModel token) async {
    await Get.toNamed(PlugRoutesNames.walletTokenLogs(
        token.type == EnumTokenType.prc10
            ? token.minUnit
            : token.contractAddress));
    initAccountStorage();
  }

  // 前往备份
  onGoToBackup() {
    Get.back();
    Get.toNamed(PlugRoutesNames.accountBackupShow);
  }

  // 暂不提醒
  onWaitBackup() {
    Get.back();
    state.accountInfo.createTime = DateTime.now();
  }

  // 监听侧边栏
  onDrawerChanged(bool? type) {
    if (type == true) {
      state.accountList.clear();
      state.accountList.addAll(dataAccountController.state.accountsList);
    } else if (type == false) {
      state.drawerSelected = '';
    }
  }

  // 侧边栏账户选择
  onDrawerSelect(String _address) {
    state.drawerSelected = _address;
  }

  // 切换账户
  onChangeAccount(String _address) async {
    state.scaffoldKey.currentState?.openEndDrawer();
    if (!dataAccountController.exchangeAccount(_address)) return;
    state.accountInfo = dataAccountController.state.nowAccount!;
    await initAccountStorage();
    LToast.success('SuccessWithSwitch'.tr);
  }

  // 管理账户
  onAdminAccount(String _address) {
    state.scaffoldKey.currentState?.openEndDrawer();
    Get.toNamed(PlugRoutesNames.accountAdmin(_address));
  }

  // 添加账户
  onAddAccount() {
    Get.back();
    Get.toNamed(PlugRoutesNames.firstOpenWallet);
  }
}
