import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plug/app/translation/translation.dart';
import 'package:plug/app/ui/components/function/loading.component.dart';

class UserLanguagePageState {
  // 语言列表
  RxList<Locale> languageList = RxList<Locale>();
  // 当前语言
  final Rx<String> _nowLanguage = ''.obs;
  String get nowLanguage => _nowLanguage.value;
  set nowLanguage (String value) => _nowLanguage.value = value;
}

class UserLanguagePageController extends GetxController {
  UserLanguagePageController();
  UserLanguagePageState state = UserLanguagePageState();

  @override
  onInit() {
    super.onInit();
    state.nowLanguage = plugTranslation.nowLocale.toLanguageTag();
    for (Locale _item in plugTranslation.localList) {
      state.languageList.add(_item);
    }
  }

  @override
  onClose() {
    LLoading.dismiss();
  }

  // 切换语言
  onChangeLanguage(Locale language) async {
    if (state.nowLanguage == language.toLanguageTag()) return;
    LLoading.showBgLoading();
    await Future.delayed(const Duration(milliseconds: 1000));
    Get.updateLocale(language);
    plugTranslation.nowLocale = language;
    Get.forceAppUpdate();
    state.nowLanguage = language.toLanguageTag();
    LLoading.dismiss();
  }
}