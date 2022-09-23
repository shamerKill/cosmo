import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plug/app/data/models/interface/interface.dart';
import 'package:plug/app/data/provider/data.account.dart';
import 'package:plug/app/ui/components/function/loading.component.dart';
import 'package:plug/app/ui/components/function/toast.component.dart';
import 'package:plug/app/ui/utils/verify.dart';
import 'package:plug/app/ui/utils/wallet.dart';

class AccountExitPasswordPageState {
  final Rx<bool> _passwordShow = false.obs;
  bool get passwordShow => _passwordShow.value;
  set passwordShow(bool value) => _passwordShow.value = value;

  final Rx<bool> _rePasswordShow = false.obs;
  bool get rePasswordShow => _rePasswordShow.value;
  set rePasswordShow(bool value) => _rePasswordShow.value = value;

  final Rx<bool> _canCreate = false.obs;
  bool get canCreate => _canCreate.value;
  set canCreate(bool value) => _canCreate.value = value;

  final Rx<bool> _createLoading = false.obs;
  bool get createLoading => _createLoading.value;
  set createLoading(bool value) => _createLoading.value = value;

  // 密码有误
  final Rx<bool> _passwordInputError = false.obs;
  bool get passwordInputError => _passwordInputError.value;
  set passwordInputError (bool value) => _passwordInputError.value = value;
  // 再次输入有误
  final Rx<bool> _rePasswordInputError = false.obs;
  bool get rePasswordInputError => _rePasswordInputError.value;
  set rePasswordInputError (bool value) => _rePasswordInputError.value = value;

  // 当前编辑账户
  final Rx<AccountModel> _accountInfo = AccountModel().obs;
  AccountModel get accountInfo => _accountInfo.value;
  set accountInfo(AccountModel value) => _accountInfo.value = value;
}

class AccountExitPasswordPageController extends GetxController {
  AccountExitPasswordPageController();

  AccountExitPasswordPageState state = AccountExitPasswordPageState();
  DataAccountController dataAccountController = Get.find();

  TextEditingController passwordController = TextEditingController();
  TextEditingController rePasswordController = TextEditingController();

  @override
  onReady() {
    if (dataAccountController.state.memAddress == null) return Get.back();
    state.accountInfo = dataAccountController
        .getAccountFromAddress(dataAccountController.state.memAddress!)!;
    passwordController.addListener(_passwordListener);
    rePasswordController.addListener(_rePasswordListener);
  }

  @override
  onClose() {
    super.onClose();
    passwordController.removeListener(_passwordListener);
    rePasswordController.removeListener(_rePasswordListener);
  }

  togglePasswordView(String type) {
    if (type == 'password') state._passwordShow.toggle();
    if (type == 'rePassword') state._rePasswordShow.toggle();
  }

  toggleAgreement(bool? type) {
    _checkGanCreate();
  }

  goToUserAgreement() => Get.toNamed('');
  goToUserPrivacy() => Get.toNamed('');

  // 输入密码监听
  _passwordListener() {
    if (!VerifyTool.password(passwordController.text)) {
      state.passwordInputError = true;
    } else {
      state.passwordInputError = false;
    }
    _checkGanCreate();
  }
  // 再次输入密码监听
  _rePasswordListener() {
    if (!VerifyTool.password(rePasswordController.text) || passwordController.text != rePasswordController.text) {
      state.rePasswordInputError = true;
    } else {
      state.rePasswordInputError = false;
    }
    _checkGanCreate();
  }
  // 判断是否可以修改
  _checkGanCreate() {
    if (VerifyTool.password(passwordController.text) &&
        passwordController.text == rePasswordController.text) {
      state.canCreate = true;
    } else {
      state.canCreate = false;
    }
  }

  // 修改
  createAccount() async {
    if (!VerifyTool.password(passwordController.text)) {
      return LToast.error('ErrorWithPasswordInput'.tr);
    }
    if (passwordController.text != rePasswordController.text) {
      return LToast.error('ErrorWithPasswordReInput'.tr);
    }
    state._createLoading.toggle();
    LLoading.showBgLoading();
    await Future.delayed(const Duration(seconds: 2));
    if (dataAccountController.state.memMnemonic == null) return Get.back();
    state.accountInfo.stringifyRaw = WalletTool.encryptMnemonic(
        dataAccountController.state.memMnemonic!, passwordController.text);
    if (!dataAccountController.updateAccount(state.accountInfo)) {
      return LToast.error('FailEdit'.tr);
    }
    LToast.error('SuccessEdit'.tr);
    state._createLoading.toggle();
    LLoading.dismiss();
    Get.back();
  }
}
