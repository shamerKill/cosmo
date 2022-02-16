import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plug/app/config/config.chain.dart';
import 'package:plug/app/data/models/interface/interface.dart';
import 'package:plug/app/data/provider/data.account.dart';
import 'package:plug/app/routes/routes.dart';
import 'package:plug/app/ui/components/function/loading.component.dart';
import 'package:plug/app/ui/components/function/toast.component.dart';
import 'package:plug/app/ui/utils/verify.dart';
import 'package:plug/app/ui/utils/wallet.dart';


class AccountCreateState {
  final Rx<bool> _passwordShow = false.obs;
  bool get passwordShow => _passwordShow.value;
  set passwordShow (bool value) => _passwordShow.value = value;
  
  final Rx<bool> _rePasswordShow = false.obs;
  bool get rePasswordShow => _rePasswordShow.value;
  set rePasswordShow (bool value) => _rePasswordShow.value = value;

  final Rx<bool> _agreement = false.obs;
  bool get agreement => _agreement.value;
  set agreement (bool value) => _agreement.value = value;
  
  final Rx<bool> _canCreate = false.obs;
  bool get canCreate => _canCreate.value;
  set canCreate (bool value) => _canCreate.value = value;

  final Rx<bool> _createLoading = false.obs;
  bool get createLoading => _createLoading.value;
  set createLoading (bool value) => _createLoading.value = value;
}

class AccountCreateController extends GetxController {
  AccountCreateController();

  AccountCreateState state = AccountCreateState();
  TextEditingController passwordController = TextEditingController();
  TextEditingController rePasswordController = TextEditingController();
  final DataAccountController dataAccountController = Get.find();

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
    state.agreement = type??state.agreement;
    _checkGanCreate();
  }
  // 用户协议
  goToUserAgreement() => Get.toNamed('');
  // 隐私保护
  goToUserPrivacy() => Get.toNamed('');
  // 判断是否可以创建
  _checkGanCreate() {
    if (
      VerifyTool.password(passwordController.text) &&
      passwordController.text == rePasswordController.text &&
      state.agreement
    ) {
      state.canCreate = true;
    } else {
      state.canCreate = false;
    }
  }
  // 创建
  createAccount() async {
    if (!VerifyTool.password(passwordController.text)) {
      return LToast.error('ErrorWithPasswordInput'.tr);
    }
    if (passwordController.text != rePasswordController.text) {
      return LToast.error('ErrorWithPasswordReInput'.tr);
    }
    if (state.agreement == false) {
      return LToast.error('ErrorWithUserArguments'.tr);
    }
    state._createLoading.toggle();
    LLoading.showBgLoading();
    await Future.delayed(const Duration(seconds: 2));
    List<String> newMnemonic = WalletTool.creaetMnemonic();
    AccountModel createdAccount = AccountModel();
    createdAccount..address = WalletTool.walletForMnemonic(newMnemonic).bech32Address
      ..nickName = '${ConfigChainData.dappNicknamePrex}-create-${(dataAccountController.state.nowAccount?.weight??-1) + 1}'
      ..stringifyRaw = WalletTool.encryptMnemonic(newMnemonic, passwordController.text)
      ..weight = (dataAccountController.state.nowAccount?.weight??-1) + 1
      ..createTime = DateTime.now();
    dataAccountController.state.memAccount = createdAccount;
    dataAccountController.state.memMnemonic = newMnemonic;
    state._createLoading.toggle();
    LLoading.dismiss();
    LToast.success('SuccessWithCreate'.tr);
    Get.offAllNamed(PlugRoutesNames.accountBackupTip);
  }
}
