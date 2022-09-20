library plug_translation;

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:ui' show window;
import 'package:get/get.dart';

import 'package:plug/app/data/provider/data.config.dart';

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
        'en-US': enUS,
        'zh-CN': zhHans,
        'en_US': enUS,
        'zh_CN': zhHans,
      };
}

class _InitTranslation {
  _PlugTranslation? translations;
  Rx<Locale> fallbackLocale = const Locale('en', 'US').obs;
  Rx<Locale> nowLocale = const Locale('en', 'US').obs;
  List<Locale> localList = [
    const Locale('zh', 'CN'),
    const Locale('en', 'US'),
  ];
  _InitTranslation();
  init() async {
    if (translations != null) return;
    try {
      String? zhHans =
          await rootBundle.loadString('assets/json/translation/zh_Hans.json');
      String? enUS =
          await rootBundle.loadString('assets/json/translation/en_US.json');
      Map<String, String> zhHansJson = {};
      (json.decode(zhHans) as Map<String, dynamic>).forEach((key, value) {
        zhHansJson[key] = value;
      });
      Map<String, String> enUSJson = {};
      (json.decode(enUS) as Map<String, dynamic>).forEach((key, value) {
        enUSJson[key] = value;
      });
      translations = _PlugTranslation(enUS: enUSJson, zhHans: zhHansJson);
      await _setDefaultLocal();
    } catch (e) {
      e;
    }
  }

  _setDefaultLocal() async {
    DataConfigController appConfig = Get.put(DataConfigController());
    if (appConfig.state.config.languageType is Locale) {
      nowLocale.value = appConfig.state.config.languageType!;
    } else if (window.locale.languageCode == 'zh') {
      nowLocale.value = localList[0];
    }
  }

  String localToString(Locale language) {
    if (language.toLanguageTag() == localList[0].toLanguageTag()) {
      return '简体中文';
    }
    if (language.toLanguageTag() == localList[1].toLanguageTag()) {
      return 'English';
    }
    return '';
  }
}

_InitTranslation plugTranslation = _InitTranslation();
