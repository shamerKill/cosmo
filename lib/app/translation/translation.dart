library plug_translation;

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/instance_manager.dart';
import 'dart:ui' show window;


class _PlugTranslation extends Translations {
  Locale? get locale => Get.deviceLocale;

  _PlugTranslation({
    required this.zhHans,
    required this.enUS,
  }) : super();

  final Map<String, String> zhHans;
  final Map<String, String> enUS;

  @override
  Map<String, Map<String, String>> get keys => {
    'en_US': enUS,
    'zh_CN': zhHans,
  };
}

class _InitTranslation {
  _PlugTranslation? translations;
  Locale fallbackLocale = const Locale('en', 'US');
  Locale nowLocale = const Locale('en', 'US');
  List<Locale> localList = [
    const Locale('zh', 'CN'),
    const Locale('en', 'US'),
  ];
  _InitTranslation();
  init() async {
    if (translations != null) return;
    try {
      String? zhHans = await rootBundle.loadString('assets/json/translation/zh_Hans.json');
      String? enUS = await rootBundle.loadString('assets/json/translation/en_US.json');
      Map<String, String> zhHansJson = {};
      (json.decode(zhHans) as Map<String, dynamic>).forEach((key, value) { zhHansJson[key] = value; });
      Map<String, String> enUSJson = {};
      (json.decode(enUS) as Map<String, dynamic>).forEach((key, value) { enUSJson[key] = value; });
      translations = _PlugTranslation(enUS: enUSJson, zhHans: zhHansJson);
      await _setDefaultLocal();
    } catch (e) {
      e;
    }
  }
  _setDefaultLocal() async {
    if (window.locale.languageCode == 'zh') {
      nowLocale = localList[0];
    }
  }
}

_InitTranslation plugTranslation = _InitTranslation();