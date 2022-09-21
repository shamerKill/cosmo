import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plug/app/data/services/net.services.dart';
import 'package:plug/app/env/env.dart';
import 'package:plug/app/ui/components/function/toast.component.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:plug/app/ui/components/function/bottomSheet.component.dart';

class UserAboutPageState {
  // 应用名称
  final Rx<String> _appName = ''.obs;
  String get appName => _appName.value;
  set appName(String value) => _appName.value = value;
  // 版本号
  final Rx<String> _appVersion = ''.obs;
  String get appVersion => _appVersion.value;
  set appVersion(String value) => _appVersion.value = value;
  // 是否有新的版本更新
  final Rx<String> _hadUpdate = ''.obs;
  String get hadUpdate => _hadUpdate.value;
  set hadUpdate(String value) => _hadUpdate.value = value;
  // 更新的网址
  final Rx<String> _downloadSite = ''.obs;
  String get downloadSite => _downloadSite.value;
  set downloadSite(String value) => _downloadSite.value = value;
  // 官网
  final Rx<String> _webSite = ''.obs;
  String get webSite => _webSite.value;
  set webSite(String value) => _webSite.value = value;
  // 推特
  final Rx<String> _twitterSite = ''.obs;
  String get twitterSite => _twitterSite.value;
  set twitterSite(String value) => _twitterSite.value = value;
}

class UserAboutPageController extends GetxController {
  UserAboutPageController();
  UserAboutPageState state = UserAboutPageState();

  @override
  onInit() {
    super.onInit();
    _getVersion();
    state.webSite = 'https://www.plugchain.info';
  }

  _getVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    String appName = packageInfo.appName;
    String version = packageInfo.version;
    state.appName = appName;
    state.appVersion = version;
    _getRemoteVersion();
  }

  // 远程版本
  _getRemoteVersion() async {
    var data = await httpToolServer.getRemoteAppVersion();
    if (data.status != 0 || data.data == null) return;
    if (data.data.isEmpty) return;
    var appInfo = data.data.first;
    if (_checkVersionUpgrade(state.appVersion, appInfo['version'])) {
      state.hadUpdate = appInfo['version'];
      state.downloadSite = appInfo['downloadurl'];
    }
  }

  // 判断版本
  bool _checkVersionUpgrade(String local, String remote) {
    List<String> localVersionList = local.split('.');
    List<String> remoteVersionList = remote.split('.');
    bool hadUpdate = false;
    for (int index = 0; index < localVersionList.length; index++) {
      if (double.parse(localVersionList[index]) >
          double.parse(remoteVersionList[index])) {
        hadUpdate = false;
        break;
      }
      if (double.parse(localVersionList[index]) <
          double.parse(remoteVersionList[index])) {
        hadUpdate = true;
        break;
      }
    }
    return hadUpdate;
  }

  // 更新版本
  onUpdateVersion() async {
    if (state.hadUpdate == '') return;
    if (Env.getEnvIsIosBrowser) {
      LToast.info('iosTestUpdatePleaseHolder'.tr);
    } else if (Env.getEnvIsGooglePlay) {
      // TODO: 谷歌商店打开
      LToast.info('googlePlayUpdatePleaseHolder'.tr);
    } else if (Env.getEnvIsAndroidBrowser) {
      bool? result = await LBottomSheet.promptBottomSheet(
        title: 'updateTip'.tr,
        message: Column(children: [
          Text('updateTipDesc'.tr),
        ]),
      );
      if (result != true) return;
      await launchUrl(Uri.parse(state.webSite));
    }
  }

  // 前往网址
  onGoToBrowser() async {
    await launchUrl(Uri.parse(state.webSite));
  }
}
