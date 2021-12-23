import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plug/app/ui/components/function/bottomSheet.component.dart';
import 'package:plug/app/ui/components/function/loading.component.dart';
import 'package:plug/app/ui/components/function/toast.component.dart';

class UserDappSettingPageState {
  // 是否开启安全模式
  // 安全模式下，每次进入DAPP都需要重新授权
  final Rx<bool> _safeMode = false.obs;
  bool get safeMode => _safeMode.value;
  set safeMode (bool value) => _safeMode.value = value;
}

class UserDappSettingPageController extends GetxController {
  UserDappSettingPageController();
  UserDappSettingPageState state = UserDappSettingPageState();

  @override
  onInit() {
    super.onInit();
    // 获取安全模式
  }
  @override
  onClose() {
    LLoading.dismiss();
  }

  // 切换安全模式
  onToggleSafeMode(bool? type) async {
    if (state.safeMode == false) {
      bool? result = await LBottomSheet.promptBottomSheet(
        title: '是否开启安全模式?',
        message: Column(
          children: [
            Text('开启安全模式下，DAPP将无法重复使用您的授权'.tr),
            Text('开启安全模式后，每次进入DAPP都需要进行授权'.tr),
          ],
        ),
      );
      if (result != true) return;
      LLoading.showBgLoading();
      await Future.delayed(const Duration(milliseconds: 500));
      state.safeMode = true;
      LToast.success('安全模式已开启'.tr);
    } else {
      bool? result = await LBottomSheet.promptBottomSheet(
        title: '是否关闭安全模式?',
        message: Column(
          children: [
            Text('关闭安全模式后，DAPP可重复使用您的授权，无需每次进入重复授权'.tr),
          ],
        ),
      );
      if (result != true) return;
      LLoading.showBgLoading();
      await Future.delayed(const Duration(milliseconds: 500));
      state.safeMode = false;
      LToast.success('安全模式已关闭'.tr);
    }
    LLoading.dismiss();
  }
  // 清理网络缓存
  onClearNetCache() async {
    bool? result = await LBottomSheet.promptBottomSheet(
      title: '是否清空网络缓存?',
    );
    if (result != true) return;
    LLoading.showBgLoading();
    await Future.delayed(const Duration(milliseconds: 1000));
    LLoading.dismiss();
    LToast.success('缓存清理成功'.tr);
  }
  // 清理DAPP授权
  onClearDappPermission() async {
    bool? result = await LBottomSheet.promptBottomSheet(
      title: '是否清空DAPP授权?',
    );
    if (result != true) return;
    LLoading.showBgLoading();
    await Future.delayed(const Duration(milliseconds: 1000));
    LLoading.dismiss();
    LToast.success('DAPP授权清理成功'.tr);
  }
}