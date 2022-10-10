import 'package:flutter/material.dart';
import 'package:flutter_webview_pro/webview_flutter.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:plug/app/data/provider/data.config.dart';
import 'package:plug/app/env/env.dart';
import 'package:plug/app/ui/components/function/bottomSheet.component.dart';
import 'package:plug/app/data/services/net.services.dart';
import 'package:plug/app/ui/components/function/button.component.dart';
import 'package:plug/app/ui/components/function/toast.component.dart';
import 'package:plug/app/ui/utils/string.dart';
import 'package:url_launcher/url_launcher.dart';

class CheckUpdateApp {
  void Function(int)? setModalHeightSheetState;
  void Function(bool)? setModalLoadingSheetState;

  String _upLoadDetail = ''; // 更新公告
  bool _isImportant = false; // 是否强制更新
  String _downloadSite = ''; // 下载地址
  String _remoteVersion = ''; // 远程版本
  void Function()? callbackFunc;
  DataConfigController appConfig = Get.put(DataConfigController());

  // 检查版本
  checkVersion(void Function() callbackFunc) async {
    this.callbackFunc = callbackFunc;
    var result = await httpToolServer.getRemoteAppVersion();
    if (result.status != 0 || result.data == null) return;
    if (result.data.isEmpty) return;
    var appInfo = result.data.first;
    _upLoadDetail = appInfo['content'];
    _isImportant = appInfo['enforce'] == '1';
    _downloadSite = appInfo['downloadurl'];
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    _remoteVersion = appInfo['version'];
    if (_checkVersionUpgrade(packageInfo.version, appInfo['version']) &&
        _checkVersionUpgrade(appConfig.state.config.ignoreVersion ?? '0.0.0',
            packageInfo.version)) {
      _showModal();
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
      await launchUrl(Uri.parse(_downloadSite), mode: LaunchMode.externalApplication);
    } else {
      LToast.info('iosTestUpdatePleaseHolder'.tr);
    }
  }

  // 忽略当前版本
  onIgnoreNowVersion() {
    appConfig.upIgnoreVersion(_remoteVersion);
    Get.back();
  }

  _showModal() {
    LBottomSheet.baseBottomSheet(
      isDismissible: !_isImportant,
      horizontalPadding: false,
      child: Column(
        children: [
          Center(
            child: SizedBox(
              width: Get.width,
              height: Get.height * 0.4,
              child: WebView(
                initialUrl: StringTool.webInfoToBase(_upLoadDetail),
              ),
            ),
          ),
          _isImportant
              ? (LButton(
                  width: Get.width * 0.8,
                  child: Text('goToUpgrade'.tr),
                  onPressed: onUpdateVersion,
                ))
              : (Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    LButton(
                      width: Get.width * 0.4,
                      child: Text('ignoreNow'.tr),
                      contrast: true,
                      onPressed: onIgnoreNowVersion,
                    ),
                    LButton(
                      width: Get.width * 0.4,
                      child: Text('goToUpgrade'.tr),
                      onPressed: onUpdateVersion,
                    )
                  ],
                )),
        ],
      ),
    );
  }
}
