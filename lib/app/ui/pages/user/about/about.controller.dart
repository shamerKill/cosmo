import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:plug/app/ui/components/function/bottomSheet.component.dart';

class UserAboutPageState {
  // 应用名称
  final Rx<String> _appName = 'Cosmo Wallet'.obs;
  String get appName => _appName.value;
  set appName (String value) => _appName.value = value;
  // 版本号
  final Rx<String> _appVersion = ''.obs;
  String get appVersion => _appVersion.value;
  set appVersion (String value) => _appVersion.value = value;
  // 是否有新的版本更新
  final Rx<String> _hadUpdate = '1.2.3'.obs;
  String get hadUpdate => _hadUpdate.value;
  set hadUpdate (String value) => _hadUpdate.value = value;
  // 官网
  final Rx<String> _webSite = ''.obs;
  String get webSite => _webSite.value;
  set webSite (String value) => _webSite.value = value;
  // 推特
  final Rx<String> _twitterSite = ''.obs;
  String get twitterSite => _twitterSite.value;
  set twitterSite (String value) => _twitterSite.value = value;
}

class UserAboutPageController extends GetxController {
  UserAboutPageController();
  UserAboutPageState state = UserAboutPageState();

  @override
  onInit() {
    super.onInit();
    _getVersion();
    state.webSite = 'https://zh.plugchain.info';
    state.twitterSite = '@plugchainclub';
  }

  _getVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    String appName = packageInfo.appName;
    String version = packageInfo.version;
    state.appName = appName;
    state.appVersion = 'v $version';
  }

  // 更新版本
  onUpdateVersion() async {
    if (state.hadUpdate == '') return;
    bool? result = await LBottomSheet.promptBottomSheet(
      title: '更新提示'.tr,
      message: Column(
        children: [
          Text('是否前往浏览器下载新版本？'.tr),
        ]
      ),
    );
    if (result != true) return;
  }
}