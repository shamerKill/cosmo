import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:plug/app/data/models/interface/interface.dart';
import 'package:plug/app/data/provider/data.account.dart';
import 'package:plug/app/data/provider/data.base-coin.dart';
import 'package:plug/app/ui/components/function/bottomSheet.component.dart';
import 'package:plug/app/ui/components/function/loading.component.dart';
import 'package:plug/app/ui/components/function/toast.component.dart';
import 'package:plug/app/data/services/net.services.dart';
import 'package:plug/app/ui/utils/number.dart';
import 'package:plug/app/ui/utils/wallet.dart';

class ChainBackupPledgePageState {
  // 节点信息
  final Rx<UserVerifierModel> _verifierInfo = UserVerifierModel().obs;
  UserVerifierModel get verifierInfo => _verifierInfo.value;
  set verifierInfo(UserVerifierModel value) => _verifierInfo.value = value;
  // 手续费数量
  final Rx<String> _feeAmount = ''.obs;
  String get feeAmount => _feeAmount.value;
  set feeAmount(String value) => _feeAmount.value = value;
  // 基础币
  final Rx<TokenModel> _baseCoin = TokenModel().obs;
  TokenModel get baseCoin => _baseCoin.value;
  set baseCoin(TokenModel value) => _baseCoin.value = value;
  // 是否在赎回质押等待中
  final Rx<bool> _pledgeLoading = false.obs;
  bool get pledgeLoading => _pledgeLoading.value;
  set pledgeLoading(bool value) => _pledgeLoading.value = value;
}

class ChainBackupPledgePageController extends GetxController {
  ChainBackupPledgePageController();
  ChainBackupPledgePageState state = ChainBackupPledgePageState();
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

  // 初始化数据
  _initData() async {
    var result = await Future.wait([
      // 节点信息
      httpToolApp.getChainVerifierInfo(state.verifierInfo.address),
      // 质押信息
      httpToolApp.getAccountDelegateData(dataAccount.state.nowAccount!.address),
      // 账户余额
      httpToolApp.getAccountBalance(dataAccount.state.nowAccount!.address,
          dataCoins.state.baseCoin.minUnit),
      // 手续费
      httpToolServer.getChainFee(),
      // 获取节点头像
      httpToolServer.getChainVerifierAvatar([state.verifierInfo.address]),
    ]);
    var _verifierInfo = result[0];
    var _accountDelegate = result[1];
    var _balance = result[2];
    var _fee = result[3];
    var _avatar = result[4];
    if (_verifierInfo != null &&
        _verifierInfo.status == 0 &&
        _verifierInfo.data != null) {
      state.verifierInfo
        ..nickName = _verifierInfo.data['validator']['description']['moniker']
        ..setStatus(_verifierInfo.data['validator']['status'])
        ..allPledged = _verifierInfo.data['validator']['tokens']
        ..minPledgeVolume =
            _verifierInfo.data['validator']['min_self_delegation'];
    }
    if (_accountDelegate != null &&
        _accountDelegate.status == 0 &&
        _accountDelegate.data != null) {
      var _res1 = _accountDelegate.data['delegation_responses'];
      state.verifierInfo.pledged = '0';
      for (var _item in _res1) {
        if (_item['delegation']['validator_address'] ==
            state.verifierInfo.address) {
          state.verifierInfo.pledged = _item['balance']['amount'];
          break;
        }
      }
    }
    if (_balance != null && _balance.status == 0) {
      state.baseCoin
          .setData((dataCoins.state.baseCoin..amount = _balance.data).toJson());
    }
    // 节点头像
    if (_avatar != null && _avatar.status == 0 && _avatar.data != null) {
      state.verifierInfo.avatar =
          _avatar.data[state.verifierInfo.address] ?? '';
    }
    state.feeAmount = _fee!.data ?? '0.0002';
    state._verifierInfo.refresh();
    state._baseCoin.refresh();
  }

  // 赎回监听
  onPledgeListener() async {
    var _unPledgeValue = NumberTool.balanceToAmount(pledgeController.text);
    var douValue = double.tryParse(_unPledgeValue);
    if (douValue == null || douValue == 0.0)
      return LToast.warning('ErrorWithVolumeInput'.tr);
    String? pass = await LBottomSheet.passwordBottomSheet();
    if (pass == null) return;
    LLoading.showBgLoading();
    var mnemonicList = await WalletTool.decryptMnemonic(
        dataAccount.state.nowAccount!.stringifyRaw, pass);
    if (mnemonicList == null) {
      LLoading.dismiss();
      return LToast.warning('ErrorWithPasswordInput'.tr);
    }
    state.pledgeLoading = true;
    var result = await WalletTool.unDelegate(
      mnemonic: mnemonicList,
      validatorAddress: state.verifierInfo.address,
      volume: _unPledgeValue,
      gasAll: NumberTool.balanceToAmount(state.feeAmount),
    );
    LLoading.dismiss();
    if (result.status == -10001)
      return LToast.error('ErrorWithRedeemCallback'.tr);
    if (result.status == -10002)
      return LToast.error('ErrorWithRedeemTimeout'.tr);
    if (result.status != 0) return LToast.error('ErrorWithRedeemUnKnow'.tr);
    LToast.success('SuccessWithRedeem'.tr);
    pledgeController.text = '0';
    _initData();
    state.pledgeLoading = false;
  }
}
