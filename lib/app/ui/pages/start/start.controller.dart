import 'package:flutter/animation.dart';
import 'package:get/get.dart';
import 'package:plug/app/data/provider/data.account.dart';
import 'package:plug/app/routes/routes.dart';

class StartPageState {
  final Rx<double> _bgOpacity = 0.0.obs;
  double get bgOpacity => _bgOpacity.value;
  set bgOpacity(double data) {
    _bgOpacity.value = data;
  }

  final Rx<double> _logoBottomPadding = 0.0.obs;
  double get logoBottomPadding => _logoBottomPadding.value;
  set logoBottomPadding(double data) {
    _logoBottomPadding.value = data;
  }
}

class StartPageController extends GetxController
    with GetTickerProviderStateMixin {
  late Animation<double> _animation;
  late AnimationController _controller;
  final int _animationTimeMilliseconds = 1000;
  final double _beginValue = 0.0;
  final double _endValue = 10.0;

  StartPageState state = StartPageState();
  final DataAccountController accountController = Get.find();

  @override
  void onInit() {
    super.onInit();
    bool _isGoTo = false;
    _controller = AnimationController(
        duration: Duration(milliseconds: _animationTimeMilliseconds),
        vsync: this);
    _animation = Tween(begin: _beginValue, end: _endValue).animate(_controller)
      ..addListener(() {
        state.bgOpacity = _animation.value / _endValue;
        // state.logoBottomPadding = _animation.value * 20;
        if (_animation.value == _endValue && !_isGoTo) {
          _isGoTo = true;
          _toPage();
        }
      });
    _controller.forward();
  }

  @override
  void onClose() {
    _controller.dispose();
    super.onClose();
  }

  _toPage() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    // Get.offAllNamed('/example');
    // 判断是否拥有账户信息
    if (accountController.state.hadAccount) {
      Get.offAllNamed(PlugRoutesNames.walletHome,
          predicate: (route) => Get.currentRoute == PlugRoutesNames.walletHome);
    } else {
      Get.offAllNamed(PlugRoutesNames.firstOpenWallet);
    }
  }
}
