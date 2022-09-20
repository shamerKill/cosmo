import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plug/app/data/models/interface/interface.dart';
import 'package:plug/app/data/provider/data.account.dart';
import 'package:plug/app/data/provider/data.base-coin.dart';
import 'package:plug/app/routes/routes.dart';
import 'package:plug/app/ui/components/function/bottomSheet.component.dart';
import 'package:plug/app/ui/components/function/loading.component.dart';
import 'package:plug/app/ui/components/function/toast.component.dart';
import 'package:plug/app/data/services/net.services.dart';
import 'package:plug/app/ui/utils/http.dart';
import 'package:plug/app/ui/utils/number.dart';
import 'package:plug/app/ui/utils/wallet.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ChainVerifierDetailPageState {
  // 验证者信息
  final Rx<UserVerifierModel> _verifierInfo = UserVerifierModel().obs;
  UserVerifierModel get verifierInfo => _verifierInfo.value;
  set verifierInfo(UserVerifierModel value) => _verifierInfo.value = value;
  // 基础币信息
  final Rx<TokenModel> _baseCoinInfo = TokenModel().obs;
  TokenModel get baseCoinInfo => _baseCoinInfo.value;
  set baseCoinInfo(TokenModel value) => _baseCoinInfo.value = value;
  // 显示已质押状态的按钮
  final Rx<bool> _showPledgedState = false.obs;
  bool get showPledgedState => _showPledgedState.value;
  set showPledgedState(bool value) => _showPledgedState.value = value;
  // 显示未质押状态的按钮
  final Rx<bool> _showNoPledgeState = false.obs;
  bool get showNoPledgeState => _showNoPledgeState.value;
  set showNoPledgeState(bool value) => _showNoPledgeState.value = value;
}

class ChainVerifierDetailPageController extends GetxController {
  ChainVerifierDetailPageController();
  ChainVerifierDetailPageState state = ChainVerifierDetailPageState();
  RefreshController refreshController = RefreshController();

  DataCoinsController dataCoins = Get.find();
  DataAccountController dataAccount = Get.find();

  @override
  onReady() async {
    String? address = Get.parameters['address'];
    if (address == null) return Get.back();
    state.verifierInfo.address = address;
    String? type = Get.parameters['type'];
    if (type == '1') {
      state.showPledgedState = true;
    } else if (type == '0') {
      state.showNoPledgeState = true;
    }
    await _getData(init: true);
    LLoading.dismiss();
  }

  @override
  onClose() {
    LLoading.dismiss();
  }

  _getData({bool init = false}) async {
    // 获取验证者信息
    if (init) LLoading.showBgLoading();
    var httpResult = await Future.wait([
      httpToolApp.getChainVerifierInfo(state.verifierInfo.address),
      httpToolApp.getChainRate(),
    ]);
    HttpToolResponse? result = httpResult.first as HttpToolResponse?;
    String chainRate = httpResult.last as String;
    if (result == null || result.status != 0 || result.data == null) return;
    var verifier = result.data['validator'];
    state.verifierInfo
      ..nickName = verifier['description']['moniker']
      ..setStatus(verifier['status'])
      ..allPledged = verifier['tokens']
      ..minPledgeVolume = verifier['min_self_delegation']
      ..yieldRate = NumberTool.toPercentage(
          inputNum: double.parse(chainRate) *
              (1 -
                  double.parse(
                      verifier['commission']['commission_rates']['rate'])));
    state.baseCoinInfo = dataCoins.state.baseCoin;
    if (state.showPledgedState == true) {
      var _res = await Future.wait([
        // 获取奖励
        httpToolApp.getAccountRewardData(dataAccount.state.nowAccount!.address,
            vAddress: state.verifierInfo.address),
        // 获取质押中数据
        httpToolApp
            .getAccountDelegateData(dataAccount.state.nowAccount!.address),
        // 获取赎回数据
        httpToolApp
            .getAccountUnDelegateData(dataAccount.state.nowAccount!.address),
        // 获取转质押数据
        httpToolApp
            .getAccountReDelegateData(dataAccount.state.nowAccount!.address),
        // 获取节点头像
        httpToolServer
            .getChainVerifierAvatar([dataAccount.state.nowAccount!.address]),
      ]);
      // 奖励
      if (_res[0] != null &&
          _res[0]?.status == 0 &&
          _res[0]!.data != null &&
          _res[0]!.data['rewards'] != null) {
        var _res0 = _res[0]!.data['rewards'];
        state.verifierInfo.reward = '0';
        for (var _item in _res0) {
          if (_item['denom'] == dataCoins.state.baseCoin.minUnit) {
            state.verifierInfo.reward = _item['amount'].split('.')[0];
            break;
          }
        }
      }
      // 质押中
      if (_res[1] != null &&
          _res[1]?.status == 0 &&
          _res[1]!.data != null &&
          _res[1]!.data['delegation_responses'] != null) {
        var _res1 = _res[1]!.data['delegation_responses'];
        state.verifierInfo.pledged = '0';
        for (var _item in _res1) {
          if (_item['delegation']['validator_address'] ==
              state.verifierInfo.address) {
            state.verifierInfo.pledged = _item['balance']['amount'];
            break;
          }
        }
      }
      // 赎回中
      if (_res[2] != null &&
          _res[2]?.status == 0 &&
          _res[2]!.data != null &&
          _res[2]!.data['unbonding_responses'] != null) {
        var _res2 = _res[2]!.data['unbonding_responses'];
        state.verifierInfo.redeeming = '0';
        for (var _item in _res2) {
          if (_item['validator_address'] == state.verifierInfo.address) {
            int _value = 0;
            for (var _pledge in _item['entries']) {
              _value += int.parse(_pledge['balance']);
            }
            state.verifierInfo.redeeming = _value.toString();
            break;
          }
        }
      }
      // 转质押中
      if (_res[3] != null &&
          _res[3]?.status == 0 &&
          _res[3]!.data != null &&
          _res[3]!.data['redelegation_responses'] != null) {
        var _res3 = _res[3]!.data['redelegation_responses'];
        for (var _item in _res3) {
          if (_item['redelegation']['validator_dst_address'] ==
              state.verifierInfo.address) {
            int _value = 0;
            for (var _pledge in _item['entries']) {
              _value += int.parse(_pledge['balance']);
            }
            state.verifierInfo.rePledging = _value.toString();
            break;
          }
        }
      }
      // 节点头像
      if (_res[4] != null && _res[4]?.status == 0 && _res[4]!.data != null) {
        state.verifierInfo.avatar =
            _res[4]!.data[state.verifierInfo.address] ?? '';
      }
    }
    state._verifierInfo.refresh();
  }

  // 赎回质押
  onBackPledge() {
    Get.toNamed(PlugRoutesNames.chainBackupPledge(state.verifierInfo.address));
  }

  // 赎回收益
  onBackReward() async {
    var promptType = await LBottomSheet.promptBottomSheet(
        title: 'withdrawTipTitle'.tr, message: Text('withdrawTipText_1'.tr));
    if (promptType != true) return;
    var password = await LBottomSheet.passwordBottomSheet();
    // 解压账户
    if (password == null) return;
    LLoading.showBgLoading();
    var mnemonicList = await WalletTool.decryptMnemonic(
        dataAccount.state.nowAccount!.stringifyRaw, password);
    if (mnemonicList == null) {
      LLoading.dismiss();
      return LToast.warning('ErrorWithPasswordInput'.tr);
    }
    var fee = await httpToolServer.getChainFee();
    var result = await WalletTool.withReward(
      mnemonic: mnemonicList,
      validatorAddress: state.verifierInfo.address,
      gasAll: NumberTool.balanceToAmount(fee.data ?? '0.0002'),
    );
    if (result.status == -10001) {
      return LToast.error('ErrorWithRedeemRewardCallback'.tr);
    }
    if (result.status == -10002) {
      return LToast.error('ErrorWithRedeemRewardTimeout'.tr);
    }
    if (result.status != 0) {
      return LToast.error('ErrorWithRedeemRewardUnKnow'.tr);
    }
    LToast.success('SuccessWithRewardRedeem'.tr);
    LLoading.dismiss();
    onRefresh();
  }

  // 转质押
  onRePledge() {
    Get.toNamed(PlugRoutesNames.chainRePledge(state.verifierInfo.address));
  }

  // 质押
  onPledge() {
    Get.toNamed(
        PlugRoutesNames.chainPledgeTransfer(state.verifierInfo.address));
  }

  // 刷新加载
  Future<void> onRefresh() async {
    await _getData();
  }
}
