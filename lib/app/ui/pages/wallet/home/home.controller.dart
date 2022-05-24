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
import 'package:plug/app/ui/utils/number.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class BasicHomePageState {
  // 消息提醒
  final Rx<bool> _hadNewsTip = false.obs;
  bool get hadNewsTip => _hadNewsTip.value;
  set hadNewsTip (bool value) => _hadNewsTip.value = value;

  // 账户列表
  final RxList<AccountModel> accountList = RxList<AccountModel>();

  // 侧边栏选中账户
  final Rx<String> _drawerSelected = ''.obs;
  String get drawerSelected => _drawerSelected.value;
  set drawerSelected (String value) => _drawerSelected.value = value;

  // 当前账户
  final Rx<AccountModel> _accountInfo = AccountModel().obs;
  AccountModel get accountInfo => _accountInfo.value;
  set accountInfo (AccountModel value) => _accountInfo.value = value;

  // 账户交易次数
  final Rx<int> _accountTransTime = 0.obs;
  int get accountTransTime => _accountTransTime.value;
  set accountTransTime (int value) => _accountTransTime.value = value;

  // 账户价值
  final Rx<String> _accountAssetsPrice = ''.obs;
  String get accountAssetsPrice => _accountAssetsPrice.value;
  set accountAssetsPrice (String value) => _accountAssetsPrice.value = value;

  // 是否隐藏余额
  final Rx<bool> _hideInfo = false.obs;
  bool get hideInfo => _hideInfo.value;
  set hideInfo (bool value) => _hideInfo.value = value;

  // 盒子高度比例0-100
  final Rx<double> _infoBoxHeightScale = 100.0.obs;
  double get infoBoxHeightScale => _infoBoxHeightScale.value;
  set infoBoxHeightScale (double value) => _infoBoxHeightScale.value = value;
  
  // 提示备份显示内容
  final RxList<Widget> tipBackupView = RxList<Widget>();

  // 桌面侧滑的key
  final Rx<GlobalKey<ScaffoldState>> _scaffoldKey = GlobalKey<ScaffoldState>().obs;
  GlobalKey<ScaffoldState> get scaffoldKey => _scaffoldKey.value;
  set scaffoldKey (GlobalKey<ScaffoldState> value) => _scaffoldKey.value = value;
}

class BasicHomePageController extends GetxController with GetTickerProviderStateMixin {
  BasicHomePageController();

  RefreshController accountRefreshController = RefreshController();

  final DataAccountController dataAccountController = Get.find();
  final DataCoinsController dataCoinsController = Get.find();
  final DataConfigController dataAppConfig = Get.find();

  BasicHomePageState state = BasicHomePageState();

  late Animation<double> _infoAnimation;
  late AnimationController _infoAnimationController;
  bool close = false;

  Timer? _timer;

  @override
  onReady() {
    super.onReady();
    _hideInit();
    initAccountStorage();
    _initAnimationController();
    _checkBackup();
  }
  @override
  onClose() {
    _timer?.cancel();
    _infoAnimationController.dispose();
    close = true;
  }

  // 初始化显示隐藏
  _hideInit() async {
    await Future.delayed(const Duration(milliseconds: 10));
    onInfoHide(type: dataAppConfig.state.config.homeValueHide);
  }

  // 获取当前账户信息
  Future<void> initAccountStorage() async {
    _checkAndInsertAccountBaseCoin();
    LLoading.showLoading();
    var result = await Future.wait<dynamic>(
      state.accountInfo.tokenList.map<Future<dynamic>>(
        (token) => httpToolApp.getAccountBalance(state.accountInfo.address, token.minUnit)
      ).toList()..addAll([
        httpToolApp.getAccountTransferLength(state.accountInfo.address),
      ])
    );
    LLoading.dismiss();
    // 更改币种余额
    var _tokensResult = result.sublist(0, state.accountInfo.tokenList.length);
    for (var i = 0; i < _tokensResult.length; i++) {
      state.accountInfo.tokenList[i].amount = _tokensResult[i]?.data??'';
    }
    state._accountInfo.refresh();
    // 更改交易次数
    var _otherResult = result.sublist(state.accountInfo.tokenList.length);
    state.accountTransTime = _otherResult[0];
    _getAccountPrice();
  }
  // 判断账户是否有基础币，如果没有加入并储存
  _checkAndInsertAccountBaseCoin() {
    var type = dataAccountController.checkAccountHadCoin(dataAccountController.state.nowAccount!.address, dataCoinsController.state.baseCoin.minUnit);
    if (!type) {
      dataAccountController.updateAccount(
        dataAccountController.state.nowAccount!..tokenList.insert(0, dataCoinsController.state.baseCoin),
      );
    }
    state.accountInfo = dataAccountController.state.nowAccount!;
  }
  // 获取账户价值
  _getAccountPrice() async {
    double num = 0.0;
    var result = await Future.wait([
      for (var token in state.accountInfo.tokenList)
        httpToolServer.getCoinPrice(token.type == enumTokenType.prc20 ? token.contractAddress : token.minUnit)
    ]);
    for (var i = 0; i < state.accountInfo.tokenList.length; i++) {
      var token = state.accountInfo.tokenList[i];
      if (result[i].status != 0 || result[i].data == null) break;
      token.price = '${result[i].data['price']}';
      num += double.tryParse(NumberTool.numMul(NumberTool.amountToBalance(token.amount, scale: token.scale), token.price))??0;
    }
    state._accountInfo.refresh();
    state.accountAssetsPrice = num.toString();
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
  onTapMenu () {
    state.scaffoldKey.currentState?.openDrawer();
  }
  // 消息
  goToNewsList () {
    Get.toNamed(PlugRoutesNames.walletNotification);
  }
  // 扫码
  goToScan () {
    Get.toNamed(PlugRoutesNames.walletQrScanner);
  }
  // 复制地址
  onCopyAddress() {
    FlutterClipboard.copy(state.accountInfo.address).then(( value ) => LToast.success('SuccessWithCopy'.tr));
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
    _infoAnimation = Tween(begin: 0.0, end: 100.0).animate(_infoAnimationController)
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
    if (_infoAnimation.value != 0.0 && _infoAnimation.value != 100.0) return;
    if (type == null) {
      state._hideInfo.toggle();
    } else {
      if (state.hideInfo == type) return;
      state.hideInfo = type;
    }
    dataAppConfig.upHomeHide(state.hideInfo);
    _infoAnimationController.forward(from: 0.0);
  }
  // 添加代币
  onAddToken() async {
    await Get.toNamed(PlugRoutesNames.walletTokenList);
    initAccountStorage();
  }
  // 我的代币详情
  onToTokenPage(String token) async {
    await Get.toNamed(PlugRoutesNames.walletTokenLogs(token));
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
    LToast.success('切换成功');
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