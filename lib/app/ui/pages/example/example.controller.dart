import 'dart:async';

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:plug/app/data/models/interface/interface.dart';
import 'package:plug/app/routes/routes.dart';
import 'package:plug/app/translation/translation.dart';
import 'package:plug/app/ui/theme/theme.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ExamplePageState {
  final Rx<String> _title = 'settingPageTitle'.obs;
  String get title => _title.value;

  final Rx<bool> _showPassWrod = false.obs;
  bool get showPassWrod => _showPassWrod.value;
  showPassWrodToggle() => _showPassWrod.toggle();

  RxList<String> items = <String>[].obs;
}

class ExamplePageController extends GetxController {
  ExamplePageState state = ExamplePageState();
  TextEditingController inputVolume = TextEditingController();
  TextEditingController password = TextEditingController();
  RefreshController accountRefreshController = RefreshController();

  ExamplePageController();

  setTitle() {
    if (state._title.value == 'resetPasswordPageTitle') {
      state._title.value = 'settingPageTitle';
    } else {
      state._title.value = 'resetPasswordPageTitle';
    }
  }

  showSnackbar() {
    Get.snackbar('title', 'message');
  }

  changeTheme() {
    appTheme.changeTheme();
  }

  chageLanguage() {
    if (Get.locale == plugTranslation.localList[0]) {
      Get.updateLocale(plugTranslation.localList[1]);
    } else {
      Get.updateLocale(plugTranslation.localList[0]);
    }
    Get.forceAppUpdate();
  }

  linkToCreateAccount() {
    Get.toNamed(PlugRoutesNames.accountCreate);
  }

  addVolume() {
    state.items.add(inputVolume.text);
    inputVolume.text = '';
  }

  Future<void> onRefresh() async {
    var accountDemo = AccountModel()
      ..address = '地址'
      ..nickName = '昵称'
      ..createTime = DateTime.now()
      ..weight = 1
      ..stringifyRaw = 'gajoifgjoasdj'
      ..tokenList = [
        TokenModel()..symbol = 'BTC',
        TokenModel()..symbol = 'ETH',
        TokenModel()..symbol = 'ALPHA',
      ];
    var newAccount = AccountModel()..setData(accountDemo.toJson());

    var verifer = VerifierModel()..status = VerifierStatusEnum.jailing;
    var verifierRaw = VerifierModel()..setData(verifer.toJson());
    await Future.delayed(const Duration(milliseconds: 1000));
    if (state.items.isEmpty) {
      state.items.value = newAccount.tokenList.map((e) => e.symbol).toList();
    } else {
      state.items.sort((a, b) => 1);
    }
  }

  Future<void> onLoading() async {
    await Future.delayed(const Duration(milliseconds: 1000));
  }
}
