import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plug/app/ui/components/function/loading.component.dart';
import 'package:plug/app/ui/components/function/toast.component.dart';
import 'package:plug/app/ui/utils/verify.dart';


class AccountExitPasswordPageState {
  final Rx<bool> _passwordShow = false.obs;
  bool get passwordShow => _passwordShow.value;
  set passwordShow (bool value) => _passwordShow.value = value;
  
  final Rx<bool> _rePasswordShow = false.obs;
  bool get rePasswordShow => _rePasswordShow.value;
  set rePasswordShow (bool value) => _rePasswordShow.value = value;
  
  final Rx<bool> _canCreate = false.obs;
  bool get canCreate => _canCreate.value;
  set canCreate (bool value) => _canCreate.value = value;

  final Rx<bool> _createLoading = false.obs;
  bool get createLoading => _createLoading.value;
  set createLoading (bool value) => _createLoading.value = value;
}

class AccountExitPasswordPageController extends GetxController {
  AccountExitPasswordPageController();

  AccountExitPasswordPageState state = AccountExitPasswordPageState();
  TextEditingController passwordController = TextEditingController();
  TextEditingController rePasswordController = TextEditingController();

  @override
  onInit() {
    super.onInit();
    passwordController.addListener(_checkGanCreate);
    rePasswordController.addListener(_checkGanCreate);
  }

  @override
  onClose() {
    super.onClose();
    passwordController.removeListener(_checkGanCreate);
    rePasswordController.removeListener(_checkGanCreate);
  }

  togglePasswordView(String type) {
    if (type == 'password') state._passwordShow.toggle();
    if (type == 'rePassword') state._rePasswordShow.toggle();
  }
  toogleAgreement(bool? type) {
    _checkGanCreate();
  }
  goToUserAgreement() => Get.toNamed('');
  goToUserPrivacy() => Get.toNamed('');
  // 判断是否可以修改
  _checkGanCreate() {
    if (
      VerifyTool.password(passwordController.text) &&
      passwordController.text == rePasswordController.text
    ) {
      state.canCreate = true;
    } else {
      state.canCreate = false;
    }
  }
  // 修改
  createAccount() {
    if (!VerifyTool.password(passwordController.text)) {
      return LToast.error('ErrorWithPasswordInput'.tr);
    }
    if (passwordController.text != rePasswordController.text) {
      return LToast.error('ErrorWithPasswordReInput'.tr);
    }
    state._createLoading.toggle();
    LLoading.showBgLoading();
    Timer(const Duration(seconds: 2), () {
      // List<String> newMnemonic = ToolWallet.creaetMnemonic();
      // InWalletData walletData = InWalletData(
      //   selected: true,
      //   address: ToolWallet.walletForMnemonic(newMnemonic).bech32Address,
      //   stringifyRaw: ToolWallet.encryptMnemonic(newMnemonic, _passControll.text),
      //   nickname: '${ToolWallet.baseCoinUnit}-${localData.walletDataBase.length + 1}',
      //   noTackupTime: DateTime.now(),
      // );
      // print(walletData);
      state._createLoading.toggle();
      LLoading.dismiss();
      Get.back();
    });
  }
}
