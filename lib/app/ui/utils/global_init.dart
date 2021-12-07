import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:plug/app/translation/translation.dart';

class UtilGlobalInit {
  static init () async {
    _changeSystemUI();
    await _changeSystemPerferred();
    await plugTranslation.init();
  }
  static _changeSystemUI() async {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      )
    );
  }
  static _changeSystemPerferred({ canRotate = false }) async {
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      if (canRotate) DeviceOrientation.landscapeLeft,
      if (canRotate) DeviceOrientation.landscapeRight,
    ]);
  }
}