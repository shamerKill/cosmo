import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenshot_switcher/flutter_screenshot_switcher.dart';
import 'package:get/get.dart';
import 'package:plug/app/data/provider/data.account.dart';
import 'package:plug/app/routes/routes.dart';
import 'package:plug/app/ui/components/function/bottomSheet.component.dart';

// TODO: 验证方式

class AccountBackupShowPageState {
  /// 助记词列表
  final RxList<String> _mnemonicList = RxList();
  List<String> get mnemonicList => _mnemonicList;

  /// 备份倒计时
  final Rx<int> _backupTimeDown = 10.obs;
  int get backupTimeDown => _backupTimeDown.value;
  set backupTimeDown (int value) => _backupTimeDown.value = value;

  /// 截屏显示内容
  final RxList<Widget> screenShotView = RxList();
}

class AccountBackupShowPageController extends GetxController {
  AccountBackupShowPageController();
  AccountBackupShowPageState state = AccountBackupShowPageState();
  final DataAccountController dataAccountController = Get.find();
  Timer? backTimeTimer;

  @override
  onInit() {
    super.onInit();
    if (dataAccountController.state.memMnemonic == null) return Get.back();
  }
  @override
  void onReady() {
    super.onReady();
    state._mnemonicList.addAll(dataAccountController.state.memMnemonic!);
    _showNoShot();
  }
  @override
  onClose() {
    backTimeTimer?.cancel();
    FlutterScreenshotSwitcher.enableScreenshots();
    super.onClose();
  }

  /// 倒计时
  _startTimer() {
    state.backupTimeDown = 10;
    Timer.periodic(const Duration(seconds: 1), (timer) {
      backTimeTimer = timer;
      if (--state.backupTimeDown == 0) {
        timer.cancel();
      }
    });
  }

  /// 备份下一步
  backupStep() {
    Get.toNamed(PlugRoutesNames.accountBackupVerify);
  }

  /// 显示请勿截屏
  _showNoShot() async {
    await LBottomSheet.baseBottomSheet(
      horizontalPadding: true,
      child: state.screenShotView[0]
    );
    if (Platform.isAndroid) FlutterScreenshotSwitcher.disableScreenshots();
    _startTimer();
  }
}