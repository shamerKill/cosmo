import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:local_auth/local_auth.dart';
import 'package:plug/app/data/provider/data.config.dart';

import 'package:plug/app/routes/routes.dart';
import 'package:plug/app/translation/translation.dart';
import 'package:plug/app/ui/components/function/toast.component.dart';

class UserMyPageState {
  // 是否开启了指纹验证
  final Rx<bool> _enableTouch = false.obs;
  bool get enableTouch => _enableTouch.value;
  set enableTouch(bool value) => _enableTouch.value = value;
  // 是否可以开启指纹验证
  final Rx<bool> _canTouch = false.obs;
  bool get canTouch => _canTouch.value;
  set canTouch(bool value) => _canTouch.value = value;
  // 当前网络
  final Rx<String> _network = ''.obs;
  String get network => _network.value;
  set network(String value) => _network.value = value;
  // 当前语言
  final Rx<Locale> _language = plugTranslation.nowLocale;
  Locale get language => _language.value;
  set language(Locale value) => _language.value = value;
}

class UserMyPageController extends GetxController {
  UserMyPageController();
  UserMyPageState state = UserMyPageState();

  final LocalAuthentication auth = LocalAuthentication();
  DataConfigController appConfig = Get.find();

  @override
  onInit() {
    super.onInit();
    _onTouchInit();
    state.network = 'mainNetwork'.tr;
  }

  // 前往账户管理地址列表
  onGoToAccountList() => Get.toNamed(PlugRoutesNames.userAccountList);
  // 前往地址簿
  onGoToAddressBookList() => Get.toNamed(PlugRoutesNames.userAddressBookList);
  // 前往消息中心
  onGoToNotificationsList() => Get.toNamed(PlugRoutesNames.walletNotification);
  // 前往DAPP设置
  onGoToDappSetting() => Get.toNamed(PlugRoutesNames.userDappSetting);
  // 切换指纹验证
  onToggleTouch(bool? type) async {
    LToast.info('functionalNoHandle'.tr);
    return;
    if (type == true) {
      try {
        var userRes =
            await auth.authenticate(localizedReason: 'getFingerprints'.tr);
        if (userRes) state.enableTouch = true;
      } on PlatformException catch (_) {}
    } else if (type == false) {
      state.enableTouch = false;
    }
  }

  // 前往网络切换
  onGoToNetwork() => Get.toNamed(PlugRoutesNames.userNetwork);
  // 前往语言切换
  onGoToLanguage() => Get.toNamed(PlugRoutesNames.userLanguage);
  // 前往使用指南
  onGoToUseHelper() => LToast.info('functionalNoHandle'.tr);
  // 前往用户协议
  onGoToAgreement() => Get.toNamed(PlugRoutesNames.dappWebview, parameters: {
        'link': base64.encode(
            utf8.encode('https://www.plugchain.network/v2/userAgreemen'))
      });
  // 前往关于我们
  onGoToAboutUs() => Get.toNamed(PlugRoutesNames.userAbout);
  // 前往问题反馈
  onGoToProblems() => Get.toNamed(PlugRoutesNames.userProblems);
  // 指纹初始化
  _onTouchInit() async {
    var canTouch = await auth.canCheckBiometrics;
    if (canTouch) {
      state.canTouch = true;
    }
  }
}
