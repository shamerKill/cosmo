import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:clipboard/clipboard.dart';
import 'package:get/get.dart';
import 'package:plug/app/data/models/interface/interface.dart';
import 'package:plug/app/data/provider/data.account.dart';
import 'package:plug/app/routes/routes.dart';
import 'package:plug/app/ui/components/function/bottomSheet.component.dart';
import 'package:plug/app/ui/components/function/loading.component.dart';
import 'package:plug/app/ui/components/function/toast.component.dart';
import 'package:plug/app/ui/components/view/qrcode.component.dart';

class BasicHomePageState {
  // 消息提醒
  final Rx<bool> _hadNewsTip = true.obs;
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
}

class BasicHomePageController extends GetxController with GetSingleTickerProviderStateMixin {
  BasicHomePageController();

  BasicHomePageState state = BasicHomePageState();
  final DataAccountController dataAccountController = Get.find();
  late Animation<double> _infoAnimation;
  late AnimationController _infoAnimationController;
  bool close = false;
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  Timer? _timer;

  @override
  onInit() {
    super.onInit();
    state.accountInfo = dataAccountController.state.nowAccount!;
    initAccountStorage();
    _initAnimationController();
  }
  @override
  onReady() {
    super.onReady();
    _checkBackup();
  }
  @override
  onClose() {
    _timer?.cancel();
    _infoAnimationController.dispose();
    close = true;
  }

  // 获取当前账户
  Future<void> initAccountStorage({String? address}) async {
    if (state.accountInfo.address == '' || address != null) {
      LLoading.showLoading();
    }
    // await initAccountNet();
  }
  Future<void> initAccountNet () async {
    int random = Random().nextInt(1000);
    await Future.delayed(const Duration(seconds: 1));
    state.accountInfo.tokenList
      ..[0].amount = '${random}38221035'
      ..[1].amount = '${random}12456712';
    state._accountInfo.refresh();
    state.accountAssetsPrice = '${random}469.123';
    state.accountTransTime = random;
    LLoading.dismiss();
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
    scaffoldKey.currentState?.openDrawer();
  }
  // 消息
  goToNewsList () {
    Get.toNamed(PlugRoutesNames.walletNotification);
  }
  // 扫码
  goToScan () {}
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
    _infoAnimationController.forward(from: 0.0);
  }
  // 添加代币
  onAddToken() {
    Get.toNamed(PlugRoutesNames.walletTokenList);
  }
  // 我的代币详情
  onToTokenPage(String token) {
    Get.toNamed(PlugRoutesNames.walletTokenLogs(token));
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
    if (type == true && state.accountList.isEmpty) {
      state.accountList.clear();
      state.accountList.addAll([
        AccountModel()
          ..address = 'gx1dxz3ywcq9nah6qyaav2quwctztst0yvyl8g04y'
          ..nickName = 'cosmo-import-1',
        AccountModel()
          ..address = 'gx1dxz3ywcq9nah6qyaav2quwctztst0yvyl8g04z'
          ..nickName = 'cosmo-import-2',
        AccountModel()
          ..address = 'gx1dxz3ywcq9nah6qyaav2quwctztst0yvyl8g04n'
          ..nickName = 'cosmo-import-3',
        AccountModel()
          ..address = 'gx1dxz3ywcq9nah6qyaav2quwctztst0yvyl8g04e'
          ..nickName = 'cosmo-create-4',
      ]);
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
    AccountModel _memAccount = AccountModel();
    state.accountList.removeWhere((ele) {
      if (ele.address == _address) _memAccount = ele;
      return ele.address == _address;
    });
    state.accountList.insert(0, _memAccount);
    scaffoldKey.currentState?.openEndDrawer();
    state._accountInfo.update((val) {
      val?.address = _memAccount.address;
      val?.nickName = _memAccount.nickName;
    });
    await initAccountStorage(address: _address);
    LToast.success('切换成功');
  }
  // 管理账户
  onAdminAccount(String _address) {
    scaffoldKey.currentState?.openEndDrawer();
    Get.toNamed(PlugRoutesNames.accountAdmin(_address));
  }
  // 添加账户
  onAddAccount() {
    Get.back();
    Get.toNamed(PlugRoutesNames.fristOpenWallet);
  }
}