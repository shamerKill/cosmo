import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plug/app/data/models/interface/interface.dart';
import 'package:plug/app/data/provider/data.account.dart';
import 'package:plug/app/data/provider/data.base-coin.dart';
import 'package:plug/app/ui/components/function/bottomSheet.component.dart';
import 'package:plug/app/ui/components/function/loading.component.dart';
import 'package:plug/app/ui/components/function/toast.component.dart';
import 'package:plug/app/ui/utils/http.dart';
import 'package:plug/app/ui/utils/number.dart';
import 'package:plug/app/ui/utils/wallet.dart';

class ChainPledgeTransferPageState {
  // 节点信息
  final Rx<UserVerifierModel> _verifierInfo = UserVerifierModel().obs;
  UserVerifierModel get verifierInfo => _verifierInfo.value;
  set verifierInfo (UserVerifierModel value) => _verifierInfo.value = value;
  // 手续费数量
  final Rx<String> _feeAmount = ''.obs;
  String get feeAmount => _feeAmount.value;
  set feeAmount (String value) => _feeAmount.value = value;
  // 基础币
  final Rx<TokenModel> _baseCoin = TokenModel().obs;
  TokenModel get baseCoin => _baseCoin.value;
  set baseCoin (TokenModel value) => _baseCoin.value = value;
  // 是否在质押等待中
  final Rx<bool> _pledgeLoading = false.obs;
  bool get pledgeLoading => _pledgeLoading.value;
  set pledgeLoading (bool value) => _pledgeLoading.value = value;
}

class ChainPledgeTransferPageController extends GetxController {
  ChainPledgeTransferPageController();
  ChainPledgeTransferPageState state = ChainPledgeTransferPageState();
  // 质押数量输入值
  TextEditingController pledgeController = TextEditingController(text: '0');

  DataAccountController dataAccount = Get.find();
  DataCoinsController dataCoins = Get.find();

  @override
  onReady() {
    String? address = Get.parameters['address'];
    if (address == null) return Get.back();
    state.verifierInfo.address = address;
    state._verifierInfo.refresh();
    _initData();
  }

  @override
  onClose() {
    LLoading.dismiss();
  }

  // 初始化数据
  _initData() async {
    var result = await Future.wait([
      // 节点信息
      httpToolApp.getChainVerifierInfo(state.verifierInfo.address),
      // 账户余额
      httpToolApp.getAccountBalance(dataAccount.state.nowAccount!.address, dataCoins.state.baseCoin.minUnit),
      // 手续费
      httpToolServer.getChainFee(),
    ]);
    var _verifierInfo = result[0];
    var _balance = result[1];
    var _fee = result[2];
    if (_verifierInfo != null && _verifierInfo.status == 0 && _verifierInfo.data != null) {
      state.verifierInfo..nickName = _verifierInfo.data['validator']['description']['moniker']
        ..setStatus(_verifierInfo.data['validator']['status'])
        ..allPledged = _verifierInfo.data['validator']['tokens']
        ..minPledgeVolume = _verifierInfo.data['validator']['min_self_delegation'];
      state._verifierInfo.refresh();
    }
    if (_balance != null && _balance.status == 0) {
      state.baseCoin.setData(
        (dataCoins.state.baseCoin..amount = _balance.data).toJson()
      );
      state._baseCoin.refresh();
    }
    state.feeAmount = _fee?.data??'0.0002';
  }

  // 质押监听
  onPledgeListener() async {
    var _pledgeValue = NumberTool.balanceToAmount(pledgeController.text);
    var douValue = double.tryParse(_pledgeValue);
    if (
      douValue == null || douValue == 0.0
    ) return LToast.warning('数量输入有误'.tr);
    String? pass = await LBottomSheet.passwordBottomSheet();
    if (pass == null) return;
    var mnemonicList = WalletTool.decryptMnemonic(dataAccount.state.nowAccount!.stringifyRaw, pass);
    if (mnemonicList == null) return LToast.warning('密码输入错误'.tr);
    Get.focusScope?.unfocus();
    state.pledgeLoading = true;
    LLoading.showBgLoading();
    var result = await WalletTool.delegate(
      mnemonic: mnemonicList,
      validatorAddress: state.verifierInfo.address,
      volume: _pledgeValue,
      gasAll: NumberTool.balanceToAmount(state.feeAmount),
    );
    LLoading.dismiss();
    state.pledgeLoading = false;
    if (result.status == -10001) return LToast.error('ErrorWithPledgeCallback'.tr);
    if (result.status == -10002) return LToast.error('ErrorWithPledgeTimeout'.tr);
    if (result.status != 0) return LToast.error('ErrorWithPledgeUnkown'.tr);
    LToast.success('SuccessWithPledge'.tr);
    pledgeController.text = '0';
    _initData();
  }
}