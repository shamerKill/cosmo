import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'dart:ui';

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:open_file/open_file.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:plug/app/ui/components/function/button.component.dart';
import 'package:flutter_webview_pro/webview_flutter.dart';
import 'package:dio/dio.dart';
import 'package:plug/app/ui/components/function/toast.component.dart';
import 'package:plug/app/ui/theme/theme.dart';
import 'package:plug/app/data/services/net.services.dart';

class CheckUpdateApp {
  late final BuildContext _context;
  bool _loading = false;
  String _downloadName = 'cosmo_wallet.apk';
  String _downloadUrl = '';
  void Function(int)? setModalHeightSheetState;
  void Function(bool)? setModalLoadingSheetState;

  CheckUpdateApp(
    BuildContext context,
  ) {
    _context = context;
  }
  
  String _upLoadDetail = ''; // 更新公告
  bool _isImportant = false; // 是否强制更新
  void Function()? callbackFunc;

  checkVersion(void Function() callbackFunc) async {
    this.callbackFunc = callbackFunc;
    var result = await httpToolServer.getVersion();
    // TODO: 获取更新
    return print(result);
    if (result.status == 200) {
      var random = Random(DateTime.now().microsecondsSinceEpoch).nextInt(10000).toString();
      _isImportant = result.data['enforce'] == '1' ? true : false;
      _upLoadDetail = result.data['content']??'';
      _downloadName = 'cosmo_wallet${result.data['version']}$random.apk';
      _downloadUrl = result.data['downloadurl'];
      await _checkVersion(result.data['version']);
    } else {
      if (this.callbackFunc != null) this.callbackFunc!();
    }
    return;
  }
  _checkVersion(String version) async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    List<String> localVersionList = packageInfo.version.split('.');
    List<String> networkVersionList = version.split('.');
    bool hadUpdate = false;
    for (int index = 0; index < localVersionList.length; index++) {
      if (double.parse(localVersionList[index]) > double.parse(networkVersionList[index])) {
        hadUpdate = false;
        break;
      }
      if (double.parse(localVersionList[index]) < double.parse(networkVersionList[index])) {
        hadUpdate = true;
        break;
      }
    }
    if (hadUpdate) {
      _showModal();
    } else {
      if (callbackFunc != null) callbackFunc!();
    }
  }
  _closeModal() {
    Navigator.of(_context).pop();
      if (callbackFunc != null) callbackFunc!();
  }
  _openDownLoad() async {
    await Future.delayed(const Duration(seconds: 1), () async {
      if (setModalLoadingSheetState != null) setModalLoadingSheetState!(false);
      await OpenFile.open(_downloadName);
      exit(0);
    });
  }
  _checkPermissions() async {
    var statusType = await Permission.storage.status;
    if (statusType.isDenied || statusType.isPermanentlyDenied) {
      statusType = await Permission.storage.request();
    }
    if (statusType.isRestricted) {
      LToast.warning('ErrorWithPermissionStorage'.tr);
      await Future.delayed(const Duration(seconds: 3));
      openAppSettings();
      return false;
    }
    if (!statusType.isGranted) {
      LToast.warning('ErrorWithPermissionStorage'.tr);
      return false;
    }
    var status = await Permission.requestInstallPackages.status;
    if (status.isDenied || status.isPermanentlyDenied) {
      status = await Permission.requestInstallPackages.request();
    }
    if (status.isRestricted) {
      LToast.warning('ErrorWithPermissionStorage'.tr);
      await Future.delayed(const Duration(seconds: 3));
      openAppSettings();
      return false;
    }
    if (!status.isGranted) {
      LToast.warning('ErrorWithPermissionStorage'.tr);
      return false;
    }
    return true;
  }
  _download() async {
    if (!(await _checkPermissions())) return exit(0);
    if (_loading) return;
    _loading = true;
    if (setModalLoadingSheetState != null) this.setModalLoadingSheetState!(true);
    // var directory = 'await AndroidPathProvider.downloadsPath';
    var directory = await getTemporaryDirectory();
    Dio dio = Dio();
    _downloadName = '${directory.path}/$_downloadName';
    await dio.download(
      _downloadUrl, _downloadName, onReceiveProgress: (received, total) {
      if (total != -1) {
        var step = (received / total * 100).toInt();
        setModalHeightSheetState!(step);
        ///当前下载的百分比例
        if (step == 100) {
          _openDownLoad();
        }
      }
    });
  }
  _showModal() {
    showModalBottomSheet(
      context: _context,
      backgroundColor: Colors.transparent,
      barrierColor: Colors.transparent,
      isDismissible: false,
      enableDrag: false,
      isScrollControlled: true,
      builder: (_) {
        double _bgHeight = 0; // 0 <= height <= 1
        int _progress = 0;
        bool _loading = false;
        return StatefulBuilder(builder: (_, setBottomSheetState) {
          setModalHeightSheetState = (int progress) {
            setBottomSheetState(() {
              _bgHeight = (progress / 100) * 300;
              _progress = progress;
            });
          };
          setModalLoadingSheetState = (bool loading) {
            setBottomSheetState(() {
              _loading = loading;
            });
          };
          return SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Positioned(
                  child: SizedBox(
                    height: 300,
                    width: 300,
                    child: Stack(
                      children: [
                        Positioned(
                          bottom: 0,
                          height: _bgHeight,
                          width: 300,
                          child: Container(
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                              color: appTheme.colors.primaryColor,
                              borderRadius: BorderRadius.all(Radius.circular(appTheme.sizes.radius)),
                            ),
                          ),
                        ),
                        Positioned(
                          child: Container(
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                              color: appTheme.colors.pageBackgroundColor.withOpacity(0.7),
                              borderRadius: BorderRadius.all(Radius.circular(appTheme.sizes.radius)),
                            ),
                            child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.symmetric(vertical: appTheme.sizes.padding),
                                    child: Text(
                                      'upgradeTitle'.tr,
                                      style: TextStyle(
                                        color: appTheme.colors.primaryColor,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: SingleChildScrollView(
                                      child: WebView(
                                        initialUrl: 'data:text/html;base64,' + base64Encode(const Utf8Encoder().convert('<!DOCTYPE html><body>$_upLoadDetail</body></html>')),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: appTheme.sizes.padding),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          flex: _isImportant ? 0 : 1,
                                          child: Offstage(
                                            offstage: _isImportant,
                                            child: LButton(
                                              contrast: true,
                                              child: Text(_loading ? '${'loadingWithUpgradeInstall'.tr}\r$_progress%' : 'upgradeVersionSkip'.tr, style: TextStyle(color: appTheme.colors.textGray)),
                                              onPressed: _loading ? null : _closeModal,
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: LButton(
                                            child: Text(_loading ? '${'loadingWithUpgradeInstall'.tr}\r$_progress%' : 'upgradeVersionInstall'.tr),
                                            onPressed: _loading ? null : _download,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        });
      }
    );
  }
}