import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:plug/app/data/provider/data.init.dart';
import 'package:plug/app/env/env.dart';
import 'package:plug/app/translation/translation.dart';
import 'package:flutter_displaymode/flutter_displaymode.dart';

class UtilGlobalInit {
  static init () async {
    _changeSystemUI();
    if (Env.envConfig.isRelease) {
      await _openSuperFPS();
    }
    await _changeSystemPerferred();
    await DataInitState.onInit();
    await plugTranslation.init();
  }
  // 修改头部背景
  static _changeSystemUI() async {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      )
    );
  }
  // 禁止转向
  static _changeSystemPerferred({ canRotate = false }) async {
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      if (canRotate) DeviceOrientation.landscapeLeft,
      if (canRotate) DeviceOrientation.landscapeRight,
    ]);
  }
  // 开启高高刷
  static _openSuperFPS() async {
    try {
      var modes = await FlutterDisplayMode.supported;
      await FlutterDisplayMode.setPreferredMode(modes[1]);
    } on PlatformException catch (e) {}
  }
}