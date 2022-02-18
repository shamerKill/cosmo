import 'package:get/get.dart';
import 'package:plug/app/data/models/interface/interface.dart';
import 'package:plug/app/data/provider/data.account.dart';
import 'package:plug/app/data/provider/data.base-coin.dart';
import 'package:plug/app/routes/routes.dart';
import 'package:plug/app/ui/components/function/loading.component.dart';
import 'package:plug/app/ui/utils/http.dart';
import 'package:plug/app/ui/utils/number.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ChainExportDelegatePageState {
  // 账户信息
  final Rx<AccountModel> _accountInfo = AccountModel().obs;
  AccountModel get accountInfo => _accountInfo.value;
  set accountInfo (AccountModel value) => _accountInfo.value = value;
  // 质押中数量
  final Rx<String> _delegatingAmount = ''.obs;
  String get delegatingAmount => _delegatingAmount.value;
  set delegatingAmount (String value) => _delegatingAmount.value = value;
  // 赎回中数量
  final Rx<String> _redeemingAmount = ''.obs;
  String get redeemingAmount => _redeemingAmount.value;
  set redeemingAmount (String value) => _redeemingAmount.value = value;
  // 质押奖励数量
  final Rx<String> _rewardedAmount = ''.obs;
  String get rewardedAmount => _rewardedAmount.value;
  set rewardedAmount (String value) => _rewardedAmount.value = value;
  // 我的质押节点列表
  final RxList<UserVerifierModel> myDelegatedVerifiesList = RxList();
  // 主流币信息
  final Rx<TokenModel> _tokenInfo = TokenModel().obs;
  TokenModel get tokenInfo => _tokenInfo.value;
  set tokenInfo (TokenModel value) => _tokenInfo.value = value;
}

class ChainExportDelegatePageController extends GetxController {
  ChainExportDelegatePageController();
  ChainExportDelegatePageState state = ChainExportDelegatePageState();
  DataAccountController dataAccount = Get.find();
  DataCoinsController dataCoins = Get.find();

  RefreshController delegateRefreshController = RefreshController();

  @override
  onReady() {
    if (!dataAccount.state.hadAccount) return Get.back();
    state.accountInfo = dataAccount.state.nowAccount!;
    state.tokenInfo = dataCoins.state.baseCoin;
    initGetData();
  }

  // 获取数据
  Future<void> initGetData() async {
    LLoading.showLoading();
    var res = await Future.wait([
      // 获取质押中信息
      httpToolApp.getAccountDelegateData(state.accountInfo.address),
      // 赎回质押信息
      httpToolApp.getAccountUnDelegateData(state.accountInfo.address),
      // 质押奖励
      httpToolApp.getAccountRewardData(state.accountInfo.address),
    ]);
    var delegateInfo = res[0];
    var unDelegateInfo = res[1];
    var rewardInfo = res[2];
    if (delegateInfo?.status != 0 || unDelegateInfo?.status != 0 || rewardInfo?.status != 0) return LLoading.dismiss();
    int _delegatingAmount = 0;
    // 循环质押列表
    state.myDelegatedVerifiesList.clear();
    for (var delegation in delegateInfo?.data['delegation_responses']) {
      _delegatingAmount += int.parse(delegation['balance']['amount']);
      // 获取质押节点基本信息
      var _info = UserVerifierModel()
        ..address = delegation['delegation']['validator_address']
        ..pledged = delegation['balance']['amount'];
      // 获取质押节点奖励
      for (var _reItem in rewardInfo?.data['rewards']) {
        if (_reItem['validator_address'] == delegation['delegation']['validator_address']) {
          var _amount = _reItem['reward'].firstWhere((_ele) => _ele['denom'] == state.tokenInfo.minUnit)['amount'];
          _info.reward = NumberTool.getNumberInt(_amount);
          break;
        }
      }
      state.myDelegatedVerifiesList.add(_info);
    }
    // 循环赎回列表
    int _unDelegatedVal = 0;
    for (var _item in unDelegateInfo?.data['unbonding_responses']) {
      for (var _back in _item['entries']) {
        _unDelegatedVal += int.parse(_back['balance']);
      }
    }
    // 循环奖励列表
    int _rewardVal = 0;
    for (var _item in rewardInfo?.data['total']) {
      _rewardVal += int.parse(NumberTool.getNumberInt(_item['amount']));
    }

    // 获取节点基本信息
    var result = await Future.wait(state.myDelegatedVerifiesList.map((_ele) => httpToolApp.getChainVerifierInfo(_ele.address)).toList());
    for (var i = 0; i < result.length; i++) {
      var resVerifier = result[i];
      var verifier = state.myDelegatedVerifiesList[i];
      verifier
        ..setStatus(resVerifier?.data['validator']['status'])
        ..nickName = resVerifier?.data['validator']['description']['moniker'];
    }

    state.delegatingAmount = _delegatingAmount.toString();
    state.redeemingAmount = _unDelegatedVal.toString();
    state.rewardedAmount = _rewardVal.toString();
    state.myDelegatedVerifiesList.refresh();
    LLoading.dismiss();
  }

  // 前往节点列表
  onGoToVerifierList() {
    Get.toNamed(PlugRoutesNames.chainVerifiersList);
  }
  // 查看已质押详情
  onGoToDelegatedDetails(UserVerifierModel verifier) {
    Get.toNamed(PlugRoutesNames.chainVerifierDetail(verifier.address, '1'));
  }
}