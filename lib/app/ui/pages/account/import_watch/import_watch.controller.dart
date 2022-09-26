import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:plug/app/data/models/interface/interface.dart';
import 'package:plug/app/data/provider/data.account.dart';
import 'package:plug/app/env/env.dart';
import 'package:plug/app/routes/routes.dart';
import 'package:plug/app/ui/components/function/bottomSheet.component.dart';
import 'package:plug/app/ui/components/function/toast.component.dart';
import 'package:plug/app/ui/utils/string.dart';

class AccountImportWatchState {
  final Rx<bool> _agreement = false.obs;
  bool get agreement => _agreement.value;
  set agreement(bool value) => _agreement.value = value;

  final Rx<bool> _canImport = false.obs;
  bool get canImport => _canImport.value;
  set canImport(bool value) => _canImport.value = value;


  final Rx<bool> _importLoading = false.obs;
  bool get importLoading => _importLoading.value;
  set importLoading(bool value) => _importLoading.value = value;


}

class AccountImportWatchController extends GetxController {
  AccountImportWatchController();
  AccountImportWatchState state = AccountImportWatchState();
  TextEditingController addressController = TextEditingController();
  final DataAccountController dataAccountController = Get.find();

  @override
  onInit() {
    super.onInit();
    addressController.addListener(_checkGanImport);
  }

  @override
  onClose() {
    super.onClose();
    addressController.addListener(_checkGanImport);
  }


  toggleAgreement(bool? type) {
    state.agreement = type ?? state.agreement;
    _checkGanImport();
  }

  // 判断是否可以导入
  _checkGanImport() {
    if (state.agreement && StringTool.checkChainAddress(addressController.text)) {
      state.canImport = true;
    } else {
      state.canImport = false;
    }
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

  
  // 导入
  importAccount() async {
    if (state.agreement == false || !StringTool.checkChainAddress(addressController.text)) {
      return LToast.error('ErrorWithUserArguments'.tr);
    }
    try {
      FocusScope.of(Get.context!).unfocus();
      SystemChannels.textInput.invokeMethod('TextInput.hide');
    } catch (_) {}
    AccountModel createdAccount = AccountModel();
    createdAccount
      ..address = addressController.text
      ..nickName =
          '${Env.envConfig.assets.accountDefaultPre}-${'watch'.tr}-${(dataAccountController.state.nowAccount?.weight ?? -1) + 1}'
      ..weight = (dataAccountController.state.nowAccount?.weight ?? -1) + 1
      ..accountClass = EnumAccountClass.watch;
    if (dataAccountController.checkAccountIsHad(createdAccount)) {
      var res =
          await LBottomSheet.promptBottomSheet(title: 'accountRepeatTip'.tr);
      if (res == false) return;
    }
    dataAccountController.addAccount(createdAccount);
    LToast.success('SuccessWithImport'.tr);
    Get.offAllNamed(PlugRoutesNames.walletHome,
        predicate: (route) => Get.currentRoute == PlugRoutesNames.walletHome);
  }
}