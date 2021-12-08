import 'dart:async';
import 'dart:math';

import 'package:flutter/animation.dart';
import 'package:get/get.dart';
import 'package:plug/app/data/models/interface/interface.dart';

class BasicHomePageState {
  // 消息提醒
  final Rx<bool> _hadNewsTip = true.obs;
  bool get hadNewsTip => _hadNewsTip.value;
  set hadNewsTip (bool value) => _hadNewsTip.value = value;

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
}

BasicHomePageState _state = BasicHomePageState();

class BasicHomePageController extends GetxController with SingleGetTickerProviderMixin {
  BasicHomePageController();

  BasicHomePageState state = _state;
  late Animation<double> _infoAnimation;
  late AnimationController _infoAnimationController;

  Timer? _timer;

  @override
  onInit() {
    super.onInit();
    initAccount();
    _initAnimationController();
  }
  @override
  onClose() {
    _timer?.cancel();
    _infoAnimationController.dispose();
  }

  // 获取当前账户
  initAccount() async {
    state.accountInfo
      .address = 'gx1dxz3ywcq9nah6qyaav2quwctztst0yvyl8g04y${Random().nextInt(1000)}';
    state._accountInfo.refresh();
    await Future.delayed(const Duration(seconds: 1));
    state.accountInfo
      .tokenList = [
        TokenModel()
          ..symbol = 'plugcn'
          ..balance = '38221035000'
          ..scale = 6
          ..minUnit = 'plugcn',
        TokenModel()
          ..symbol = 'shamer'
          ..balance = '124567'
          ..scale = 2
          ..minUnit = 'sha',
      ];
    state._accountInfo.refresh();
  }
  // 菜单
  onTapMenu () {}
  // 消息
  goToNewsList () {}
  // 扫码
  goToScan () {}
  // 复制地址
  onCopyAddress() {}
  // 显示二维码
  onShowScan() {}
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
  onInfoHide() {
    if (_infoAnimation.value != 0.0 && _infoAnimation.value != 100.0) return;
    state._hideInfo.toggle();
    _infoAnimationController.forward(from: 0.0);
  }
}