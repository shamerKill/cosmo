import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plug/app/data/models/interface/interface.dart';
import 'package:plug/app/data/provider/data.account.dart';
import 'package:plug/app/ui/components/function/loading.component.dart';
import 'package:plug/app/ui/components/function/toast.component.dart';
import 'package:plug/app/ui/utils/wallet.dart';

class AccountAdminVerifyPageState {
  // 账户信息
  final Rx<AccountModel> _accountInfo = AccountModel().obs;
  AccountModel get accountInfo => _accountInfo.value;
  set accountInfo (AccountModel value) => _accountInfo.value = value;
  // 类型判断 0密码｜1助记词
  final Rx<int> _type = 0.obs;
  int get type => _type.value;
  set type (int value) => _type.value = value;
  // 验证loaning
  final Rx<bool> _verifyLoading = false.obs;
  bool get verifyLoading => _verifyLoading.value;
  set verifyLoading (bool value) => _verifyLoading.value = value;
  // 密码框
  final Rx<bool> _passwordShow = false.obs;
  bool get passwordShow => _passwordShow.value;
  set passwordShow (bool value) => _passwordShow.value = value;
}

class AccountAdminVerifyPageController extends GetxController {
  AccountAdminVerifyPageController();
  AccountAdminVerifyPageState state = AccountAdminVerifyPageState();
  // 助记词
  TextEditingController mnemonicController = TextEditingController();
  // 密码
  TextEditingController passwordController = TextEditingController();

  DataAccountController dataAccountController = Get.find();

  @override
  onInit() {
    super.onInit();
    String? address = Get.parameters['address'];
    String? type = Get.parameters['type'];
    if (address == null || type == null) return Get.back();
    state.accountInfo = dataAccountController.getAccountFromAddress(address)!;
    if (type == 'password') state.type = 0;
    if (type == 'mnemonic') state.type = 1;
  }

  @override
  onClose() {
    if (LLoading.isShow()) LLoading.dismiss();
  }

  togglePasswordView(String type) {
    if (type == 'password') state._passwordShow.toggle();
  }

  // 验证方法
  onVerifyCallBack() async {
    state.verifyLoading = true;
    LLoading.showBgLoading();
    await Future.delayed(const Duration(seconds: 1));
    String? resultMnemonic;
    if (state.type == 0) {
      try {
        var mnemonic = await WalletTool.decryptMnemonic(state.accountInfo.stringifyRaw, passwordController.text);
        if (mnemonic != null) resultMnemonic = mnemonic.join(' ');
      } catch (e) {
        LToast.error('ErrorWithPasswordInput'.tr);
      }
    }
    LLoading.dismiss();
    state.verifyLoading = false;
    if (state.type == 1) return LToast.error('notSupportedMnemonic'.tr);
    // 助记词列表
    if (resultMnemonic == null) return LToast.error('ErrorWithPasswordInput'.tr);
    Get.back<String?>(result: resultMnemonic);
  }
}