import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plug/app/data/models/interface/interface.dart';
import 'package:plug/app/data/provider/data.account.dart';
import 'package:plug/app/env/env.dart';
import 'package:plug/app/routes/routes.dart';
import 'package:plug/app/ui/components/function/loading.component.dart';
import 'package:plug/app/ui/components/function/toast.component.dart';
import 'package:plug/app/ui/utils/verify.dart';
import 'package:plug/app/ui/utils/wallet.dart';

class AccountCreateState {
  final Rx<bool> _passwordShow = false.obs;
  bool get passwordShow => _passwordShow.value;
  set passwordShow(bool value) => _passwordShow.value = value;

  final Rx<bool> _rePasswordShow = false.obs;
  bool get rePasswordShow => _rePasswordShow.value;
  set rePasswordShow(bool value) => _rePasswordShow.value = value;

  final Rx<bool> _agreement = false.obs;
  bool get agreement => _agreement.value;
  set agreement(bool value) => _agreement.value = value;

  final Rx<bool> _canCreate = false.obs;
  bool get canCreate => _canCreate.value;
  set canCreate(bool value) => _canCreate.value = value;

  final Rx<bool> _createLoading = false.obs;
  bool get createLoading => _createLoading.value;
  set createLoading(bool value) => _createLoading.value = value;

  // 密码有误
  final Rx<bool> _passwordInputError = false.obs;
  bool get passwordInputError => _passwordInputError.value;
  set passwordInputError(bool value) => _passwordInputError.value = value;
  // 再次输入有误
  final Rx<bool> _rePasswordInputError = false.obs;
  bool get rePasswordInputError => _rePasswordInputError.value;
  set rePasswordInputError(bool value) => _rePasswordInputError.value = value;

  // 账户类型列表
  final RxList<EnumAccountType> accountTypeList = RxList([
    EnumAccountType.prc20,
  ]);
  // 账户类型选择
  final Rx<EnumAccountType> _accountType = EnumAccountType.prc20.obs;
  EnumAccountType get accountType => _accountType.value;
  set accountType(EnumAccountType value) => _accountType.value = value;
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
    state.agreement = type ?? state.agreement;
    _checkGanCreate();
  }

  // 切换账户类型
  switchAccountType(int type) {
    state.accountType = state.accountTypeList[type];
  }

  // 用户协议
  goToUserAgreement() => Get.toNamed(PlugRoutesNames.dappWebview, parameters: {
        'link': base64.encode(
            utf8.encode('https://www.plugchain.network/v2/userAgreemen'))
      });
  // 隐私保护
  goToUserPrivacy() => Get.toNamed(PlugRoutesNames.dappWebview, parameters: {
        'link': base64.encode(
            utf8.encode('https://www.plugchain.network/v2/privacyAgreemen'))
      });
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
    if (!VerifyTool.password(rePasswordController.text) ||
        passwordController.text != rePasswordController.text) {
      state.rePasswordInputError = true;
    } else {
      state.rePasswordInputError = false;
    }
    _checkGanCreate();
  }

  // 判断是否可以创建
  _checkGanCreate() {
    if (VerifyTool.password(passwordController.text) &&
        passwordController.text == rePasswordController.text &&
        state.agreement) {
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
    List<String> newMnemonic = WalletTool.createMnemonic();
    AccountModel createdAccount = AccountModel();
    createdAccount
      ..address = _getAccountAddress(newMnemonic)
      ..nickName =
          '${Env.envConfig.assets.accountDefaultPre}-${'create'.tr}-${(dataAccountController.state.nowAccount?.weight ?? -1) + 1}'
      ..stringifyRaw =
          WalletTool.encryptMnemonic(newMnemonic, passwordController.text)
      ..weight = (dataAccountController.state.nowAccount?.weight ?? -1) + 1
      ..createTime = DateTime.now()
      ..accountType = state.accountType;
    dataAccountController.state.memAccount = createdAccount;
    dataAccountController.state.memMnemonic = newMnemonic;
    state._createLoading.toggle();
    LLoading.dismiss();
    LToast.success('SuccessWithCreate'.tr);
    Get.offAllNamed(PlugRoutesNames.accountBackupTip);
  }

  String _getAccountAddress(List<String> mnemonic) {
    // 创建20账户
    if (state.accountType == EnumAccountType.prc20) {
      return WalletTool.walletForMnemonicPrc20(mnemonic).bech32Address;
    } else {
      // 创建10账户
      return WalletTool.walletForMnemonic(mnemonic).bech32Address;
    }
  }
}
