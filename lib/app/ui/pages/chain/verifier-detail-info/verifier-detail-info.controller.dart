import 'package:get/get.dart';
import 'package:plug/app/data/models/interface/interface.dart';
import 'package:plug/app/data/provider/data.account.dart';
import 'package:plug/app/data/provider/data.base-coin.dart';
import 'package:plug/app/ui/components/function/loading.component.dart';
import 'package:plug/app/data/services/net.services.dart';

class ChainVerifierDetailInfoPageState {
  // 验证者信息
  final Rx<UserVerifierModel> _verifierInfo = UserVerifierModel().obs;
  UserVerifierModel get verifierInfo => _verifierInfo.value;
  set verifierInfo(UserVerifierModel value) => _verifierInfo.value = value;
  // 基础币信息
  final Rx<TokenModel> _baseCoinInfo = TokenModel().obs;
  TokenModel get baseCoinInfo => _baseCoinInfo.value;
  set baseCoinInfo(TokenModel value) => _baseCoinInfo.value = value;
}

class ChainVerifierDetailInfoPageController extends GetxController {
  ChainVerifierDetailInfoPageController();
  ChainVerifierDetailInfoPageState state = ChainVerifierDetailInfoPageState();

  DataCoinsController dataCoins = Get.find();
  DataAccountController dataAccount = Get.find();

  @override
  onReady() async {
    String? address = Get.parameters['address'];
    if (address == null) return Get.back();
    state.verifierInfo.address = address;
    LLoading.showBgLoading();
    await _getData();
    LLoading.dismiss();
  }

  @override
  onClose() {
    LLoading.dismiss();
  }

  _getData() async {
    // 获取验证者信息
    var result =
        await httpToolApp.getChainVerifierInfo(state.verifierInfo.address);
    if (result == null || result.status != 0 || result.data == null) return;
    var verifier = result.data['validator'];
    state.verifierInfo
      ..nickName = verifier['description']['moniker']
      ..setStatus(verifier['status'])
      ..allPledged = verifier['tokens']
      ..minPledgeVolume = verifier['min_self_delegation'];
    state.baseCoinInfo = dataCoins.state.baseCoin;
    var _res = await Future.wait([
      // 获取奖励
      httpToolApp.getAccountRewardData(dataAccount.state.nowAccount!.address,
          vAddress: state.verifierInfo.address),
      // 获取质押中数据
      httpToolApp.getAccountDelegateData(dataAccount.state.nowAccount!.address),
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
          state.verifierInfo.reward = _item['amount'];
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
    state._verifierInfo.refresh();
  }
}
