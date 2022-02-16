import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plug/app/data/models/interface/interface.dart';
import 'package:plug/app/data/provider/data.account.dart';
import 'package:plug/app/routes/routes.dart';
import 'package:plug/app/ui/components/function/loading.component.dart';
import 'package:plug/app/ui/components/function/toast.component.dart';
import 'package:plug/app/ui/utils/verify.dart';
import 'package:plug/app/ui/utils/wallet.dart';
import 'package:plug/app/config/config.chain.dart';

class AccountImportPageState {
  final Rx<bool> _passwordShow = false.obs;
  bool get passwordShow => _passwordShow.value;
  set passwordShow (bool value) => _passwordShow.value = value;
  
  final Rx<bool> _rePasswordShow = false.obs;
  bool get rePasswordShow => _rePasswordShow.value;
  set rePasswordShow (bool value) => _rePasswordShow.value = value;

  final Rx<bool> _agreement = false.obs;
  bool get agreement => _agreement.value;
  set agreement (bool value) => _agreement.value = value;
  
  final Rx<bool> _canImport = false.obs;
  bool get canImport => _canImport.value;
  set canImport (bool value) => _canImport.value = value;

  final Rx<bool> _importLoading = false.obs;
  bool get importLoading => _importLoading.value;
  set importLoading (bool value) => _importLoading.value = value;
}

class AccountImportPageController extends GetxController {
  AccountImportPageController();
  AccountImportPageState state = AccountImportPageState();
  // 助记词
  TextEditingController mnemonicController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController rePasswordController = TextEditingController();
  final DataAccountController dataAccountController = Get.find();



  @override
  onInit() {
    super.onInit();
    mnemonicController.addListener(_checkGanImport);
    passwordController.addListener(_checkGanImport);
    rePasswordController.addListener(_checkGanImport);
  }

  @override
  onClose() {
    super.onClose();
    mnemonicController.addListener(_checkGanImport);
    passwordController.removeListener(_checkGanImport);
    rePasswordController.removeListener(_checkGanImport);
  }

  toogleAgreement(bool? type) {
    state.agreement = type??state.agreement;
    _checkGanImport();
  }
  togglePasswordView(String type) {
    if (type == 'password') state._passwordShow.toggle();
    if (type == 'rePassword') state._rePasswordShow.toggle();
  }
  goToUserAgreement() => Get.toNamed('');
  goToUserPrivacy() => Get.toNamed('');
  // 判断是否可以导入
  _checkGanImport() {
    if (
      VerifyTool.password(passwordController.text) &&
      passwordController.text == rePasswordController.text &&
      state.agreement
    ) {
      // 助记词判断
      List<String> mnemonic = mnemonicController.text.split(RegExp(r"[^a-zA-Z]+"));
      if (_checkMnemonic(mnemonic)) {
        state.canImport = true;
      } else {
        state.canImport = false;
      }
    } else {
      state.canImport = false;
    }
  }
  // 导入
  importAccount () async {
    if (!VerifyTool.password(passwordController.text)) {
      return LToast.error('ErrorWithPasswordInput'.tr);
    }
    if (passwordController.text != rePasswordController.text) {
      return LToast.error('ErrorWithPasswordReInput'.tr);
    }
    if (state.agreement == false) {
      return LToast.error('ErrorWithUserArguments'.tr);
    }
    try {
      await processImport();
    } catch (e) {
      state._importLoading.toggle();
      LLoading.dismiss();
      LToast.error('ErrorWithMnemonicInput'.tr);
    }
  }
  // 进行导入
  processImport() async {
    List<String> mnemonic = mnemonicController.text.split(RegExp(r"[^a-zA-Z]+"));
    if (!_checkMnemonic(mnemonic)) {
      return LToast.error('ErrorWithMnemonicInput'.tr);
    }
    state._importLoading.toggle();
    LLoading.showBgLoading();
    await Future.delayed(const Duration(seconds: 2));
    var newWallet = WalletTool.walletForMnemonic(mnemonic);
    AccountModel createdAccount = AccountModel();
    createdAccount..address = newWallet.bech32Address
      ..nickName = '${ConfigChainData.dappNicknamePrex}-import-${(dataAccountController.state.nowAccount?.weight??-1) + 1}'
      ..stringifyRaw = WalletTool.encryptMnemonic(mnemonic, passwordController.text)
      ..weight = (dataAccountController.state.nowAccount?.weight??-1) + 1;
    dataAccountController.addAccount(createdAccount);
    state._importLoading.toggle();
    LLoading.dismiss();
    LToast.success('SuccessWithImport'.tr);
    Get.offAllNamed(PlugRoutesNames.walletHome);
  }

  // 判断助记词是否可用
  _checkMnemonic(List<String> mnemonic) {
    if (mnemonic.length == 12) return true;
    if (mnemonic.length == 16) return true;
    if (mnemonic.length == 24) return true;
    return false;
  }
}