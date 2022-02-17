import 'package:flutter/animation.dart';
import 'package:get/get.dart';
import 'package:plug/app/data/models/interface/interface.dart';
import 'package:plug/app/data/provider/data.account.dart';
import 'package:plug/app/routes/routes.dart';

class StartPageState {
  final Rx<double> _bgOpacity = 0.0.obs;
  double get bgOpacity => _bgOpacity.value;
  set bgOpacity (double data) { _bgOpacity.value = data; }

  final Rx<double> _logoBottomPadding = 0.0.obs;
  double get logoBottomPadding => _logoBottomPadding.value;
  set logoBottomPadding (double data) { _logoBottomPadding.value = data; }
}

class StartPageController extends GetxController with GetTickerProviderStateMixin {
  late Animation<double> _animation;
  late AnimationController _controller;
  final int _animationTimeMillisseconds = 1000;
  final double _beginValue = 0.0;
  final double _endValue = 10.0;

  StartPageState state = StartPageState();
  final DataAccountController accountController = Get.find();

  @override
  void onInit() {
    super.onInit();
    _controller = AnimationController(
        duration: Duration(milliseconds: _animationTimeMillisseconds), vsync: this);
    _animation = Tween(begin: _beginValue, end: _endValue).animate(_controller)
      ..addListener(() {
        state.bgOpacity = _animation.value / _endValue;
        state.logoBottomPadding = _animation.value * 20;
        if (_animation.value == _endValue) _toPage();
      });
    _controller.forward();
  }

  @override
  void onClose() {
    super.onClose();
    _controller.dispose();
  }

  _toPage() async {
    await Future.delayed(const Duration(milliseconds: 100));
    // Get.offAllNamed('/example');
    // 判断是否拥有账户信息
    if (accountController.state.hadAccount) {
      Get.offAllNamed(PlugRoutesNames.walletHome);
    } else {
      Get.offAllNamed(PlugRoutesNames.fristOpenWallet);
    }
  }
}