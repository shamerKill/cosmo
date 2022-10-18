import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_webview_pro/webview_flutter.dart';
import 'package:plug/app/data/provider/data.init.dart';
import 'package:plug/app/env/env.dart';
import 'package:plug/app/routes/routes.dart';
import 'package:plug/app/translation/translation.dart';
import 'package:flutter_displaymode/flutter_displaymode.dart';
import 'package:uni_links/uni_links.dart';

class UtilGlobalInit {
  static init() async {
    _changeSystemUI();
    _changeAndroidWebview();
    if (Env.envConfig.isRelease && Env.getEnvIsAndroid) {
      await _openSuperFPS();
    }
    await _changeSystemPerferred();
    await DataInitState.onInit();
    await plugTranslation.init();
    await _getDeepLink();
  }

  // 修改头部背景
  static _changeSystemUI() async {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
  }

  // 更改webview
  static _changeAndroidWebview() {
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  // 禁止转向
  static _changeSystemPerferred({canRotate = false}) async {
    try {
      await SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
        if (canRotate) DeviceOrientation.landscapeLeft,
        if (canRotate) DeviceOrientation.landscapeRight,
      ]);
    } on PlatformException catch (_) {}
  }

  // 开启高高刷
  static _openSuperFPS() async {
    try {
      var modes = await FlutterDisplayMode.supported;
      await FlutterDisplayMode.setPreferredMode(modes[1]);
    } on PlatformException catch (_) {}
  }

  // 判断是否有外部连接
  static String? getDeepLink;
  static Future<String?> _getDeepLink() async {
    final initialUri = await getInitialUri();
    String? result = initialUri?.path;
    switch (initialUri?.path) {
      case '/web':
        if (initialUri?.queryParameters['href'] is String) {
          result = PlugRoutesNames.dappWebviewRoute(base64
              .encode(utf8.encode(initialUri?.queryParameters['href'] ?? '')));
        }
        break;
    }
    getDeepLink = result;
    return result;
  }
}
