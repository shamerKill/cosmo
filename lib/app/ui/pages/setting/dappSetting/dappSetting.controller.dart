import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plug/app/data/provider/data.account.dart';
import 'package:plug/app/data/provider/data.config.dart';
import 'package:plug/app/data/provider/data.dapp-address.dart';
import 'package:plug/app/ui/components/function/bottomSheet.component.dart';
import 'package:plug/app/ui/components/function/loading.component.dart';
import 'package:plug/app/ui/components/function/toast.component.dart';
import 'package:flutter_webview_pro/webview_flutter.dart';

class UserDappSettingPageState {
  // 是否开启安全模式
  // 安全模式下，每次进入DAPP都需要重新授权
  final Rx<bool> _safeMode = false.obs;
  bool get safeMode => _safeMode.value;
  set safeMode(bool value) => _safeMode.value = value;
  // webview controller
  // webview控制器
  final Rx<WebViewController?> _webviewController = Rx(null);
  WebViewController? get webviewController => _webviewController.value;
  set webviewController(WebViewController? value) =>
      _webviewController.value = value;
}

class UserDappSettingPageController extends GetxController {
  UserDappSettingPageController();
  UserDappSettingPageState state = UserDappSettingPageState();

  DataDappAddressController dataDappAddress = Get.find();
  DataAccountController dataAccount = Get.find<DataAccountController>();
  DataConfigController dataConfig = Get.find();

  @override
  onInit() {
    super.onInit();
    // 获取安全模式
    state.safeMode = dataConfig.state.config.safeDappView;
  }

  @override
  onClose() {
    LLoading.dismiss();
  }

  // 切换安全模式
  onToggleSafeMode(bool? type) async {
    if (state.safeMode == false) {
      bool? result = await LBottomSheet.promptBottomSheet(
        title: 'dappSafeModeTip'.tr,
        message: Column(
          children: [
            Text('dappSafeModeDesc_1'.tr),
            Text('dappSafeModeDesc_2'.tr),
            Text('dappSafeModeDesc_3'.tr),
          ],
        ),
      );
      if (result != true) return;
      LLoading.showBgLoading();
      var nowAccount = dataAccount.state.nowAccount;
      nowAccount?.dappPermissionList.clear();
      dataAccount.updateAccount(nowAccount);
      await Future.delayed(const Duration(milliseconds: 500));
      state.safeMode = true;
      LToast.success('SuccessWithSafeModeOpen'.tr);
    } else {
      bool? result = await LBottomSheet.promptBottomSheet(
        title: 'dappCloseSafeModeTip'.tr,
        message: Column(
          children: [
            Text('dappCloseSafeModeDesc_1'.tr),
          ],
        ),
      );
      if (result != true) return;
      LLoading.showBgLoading();
      await Future.delayed(const Duration(milliseconds: 500));
      state.safeMode = false;
      LToast.success('SuccessWithSafeModeClose'.tr);
    }
    dataConfig.upSafeViewType(state.safeMode);
    LLoading.dismiss();
  }

  // 清理网络缓存
  onClearNetCache() async {
    bool? result = await LBottomSheet.promptBottomSheet(
      title: 'clearNetCacheTip'.tr,
    );
    if (result != true) return;
    if (state.webviewController == null) {
      return LToast.error('ErrorWithClear'.tr);
    }
    try {
      LLoading.showBgLoading();
      state.webviewController?.clearCache();
      await WebView.platform.clearCookies();
      await Future.delayed(const Duration(milliseconds: 1000));
    } catch (_) {
      LLoading.dismiss();
      return LToast.error('ErrorWithNoClear'.tr);
    }
    LLoading.dismiss();
    LToast.success('SuccessWithClearDapp'.tr);
  }

  // 清理DAPP授权
  onClearDappPermission() async {
    bool? result = await LBottomSheet.promptBottomSheet(
      title: 'clearDappPermissionTip'.tr,
    );
    if (result != true) return;
    LLoading.showBgLoading();
    var nowAccount = dataAccount.state.nowAccount;
    nowAccount?.dappPermissionList.clear();
    dataAccount.updateAccount(nowAccount);
    await Future.delayed(const Duration(milliseconds: 1000));
    LLoading.dismiss();
    LToast.success('SuccessWithClearDappPermission'.tr);
  }
}
