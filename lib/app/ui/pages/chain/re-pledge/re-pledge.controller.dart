import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:plug/app/data/models/interface/interface.dart';
import 'package:plug/app/data/provider/data.account.dart';
import 'package:plug/app/data/provider/data.base-coin.dart';
import 'package:plug/app/routes/routes.dart';
import 'package:plug/app/ui/components/function/bottomSheet.component.dart';
import 'package:plug/app/ui/components/function/loading.component.dart';
import 'package:plug/app/ui/components/function/toast.component.dart';
import 'package:plug/app/data/services/net.services.dart';
import 'package:plug/app/ui/utils/number.dart';
import 'package:plug/app/ui/utils/wallet.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ChainRePledgePageState {
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
  // 是否在转质押等待中
  final Rx<bool> _pledgeLoading = false.obs;
  bool get pledgeLoading => _pledgeLoading.value;
  set pledgeLoading(bool value) => _pledgeLoading.value = value;
  // 所有节点列表
  RxList<UserVerifierModel> allVerifiers = RxList();
  // 节点分页
  final Rx<int> _allVerifiersPage = 1.obs;
  int get allVerifiersPage => _allVerifiersPage.value;
  set allVerifiersPage(int value) => _allVerifiersPage.value = value;
  // 选中的节点
  final Rx<UserVerifierModel> _selectVerifier = UserVerifierModel().obs;
  UserVerifierModel get selectVerifier => _selectVerifier.value;
  set selectVerifier(UserVerifierModel value) => _selectVerifier.value = value;
}

class ChainRePledgePageController extends GetxController {
  ChainRePledgePageController();
  ChainRePledgePageState state = ChainRePledgePageState();
  // 转质押数量输入值
  TextEditingController pledgeController = TextEditingController(text: '0');
  RefreshController verifiersRefreshController = RefreshController();

  DataAccountController dataAccount = Get.find();
  DataCoinsController dataCoins = Get.find();

  @override
  onReady() async {
    String? address = Get.parameters['address'];
    if (address == null) return Get.back();
    state.verifierInfo.address = address;
    state._verifierInfo.refresh();
    LLoading.showBgLoading();
    await _initData();
    LLoading.dismiss();
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
      // 获取奖励
      httpToolApp.getAccountRewardData(dataAccount.state.nowAccount!.address,
          vAddress: state.verifierInfo.address),
      // 获取节点头像
      httpToolServer.getChainVerifierAvatar([state.verifierInfo.address]),
    ]);
    var _verifierInfo = result[0];
    var _accountDelegate = result[1];
    var _balance = result[2];
    var _fee = result[3];
    var _reward = result[4];
    var _avatar = result[5];
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
    // 奖励
    if (_reward != null &&
        _reward.status == 0 &&
        _reward.data != null &&
        _reward.data['rewards'] != null) {
      var _res0 = _reward.data['rewards'];
      state.verifierInfo.reward = '0';
      for (var _item in _res0) {
        if (_item['denom'] == dataCoins.state.baseCoin.minUnit) {
          state.verifierInfo.reward = NumberTool.getNumberInt(_item['amount']);
          break;
        }
      }
    }
    // 节点头像
    if (_avatar != null && _avatar.status == 0 && _avatar.data != null) {
      state.verifierInfo.avatar =
          _avatar.data[state.verifierInfo.address] ?? '';
    }
    state.feeAmount = _fee!.data ?? '0.0002';
    state._verifierInfo.refresh();
    state._baseCoin.refresh();
    await _getVerifierList();
  }

  // 获取分页数据
  Future<void> _getVerifierList() async {
    var result = await httpToolApp.getChainVerifiersList(state.allVerifiersPage,
        limit: 10);
    List<UserVerifierModel> list = [];
    if (result.status == 0) {
      if (result.data.length < 10) state.allVerifiersPage = 0;
      for (var _item in result.data) {
        if (_item['operator_address'] == state.verifierInfo.address) continue;
        list.add(UserVerifierModel()
          ..address = _item['operator_address']
          ..setStatus(_item['status'])
          ..nickName = _item['description']['moniker']
          ..allPledged = _item['tokens']
          ..minPledgeVolume = _item['min_self_delegation']);
      }
    }
    // 获取节点头像
    var avatarList = await httpToolServer
        .getChainVerifierAvatar(list.map((e) => e.address).toList());
    for (var element in list) {
      element.avatar = avatarList?.data[element.address] ?? '';
    }
    state.allVerifiers.addAll(list);
  }

  // 刷新列表
  Future<void> onRefreshVerifiersList() async {
    state.allVerifiers.clear();
    state.allVerifiersPage = 1;
    await _getVerifierList();
  }

  // 加载列表
  Future<void> onLoadVerifiersList() async {
    if (state.allVerifiersPage == 0) return;
    state.allVerifiersPage++;
    await _getVerifierList();
  }

  // 查看节点详情
  onVerifierDetailListener(UserVerifierModel verifier) {
    Get.toNamed(PlugRoutesNames.chainVerifierDetailNull(verifier.address));
  }

  //  转让质押监听
  onPledgeListener() async {
    if (state.selectVerifier.address == '') return;
    var _rePledgeValue = NumberTool.balanceToAmount(pledgeController.text);
    var douValue = double.tryParse(_rePledgeValue);
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
    Get.focusScope?.unfocus();
    state.pledgeLoading = true;
    var result = await WalletTool.reDelegate(
      mnemonic: mnemonicList,
      validatorSrcAddress: state.verifierInfo.address,
      validatorDstAddress: state.selectVerifier.address,
      volume: _rePledgeValue,
      gasAll: NumberTool.balanceToAmount(state.feeAmount),
    );
    LLoading.dismiss();
    state.pledgeLoading = false;
    if (result.status == -10001)
      return LToast.error('ErrorWithRePledgeCallback'.tr);
    if (result.status == -10002)
      return LToast.error('ErrorWithRePledgeTimeout'.tr);
    if (result.status != 0) return LToast.error('ErrorWithRePledgeUnKnow'.tr);
    LToast.success('SuccessRePledgeRedeem'.tr);
    pledgeController.text = '0';
  }

  // 选择转质押节点
  onSelectVerifier(UserVerifierModel verifier) {
    if (verifier.address == state.selectVerifier.address) {
      state.selectVerifier = UserVerifierModel();
    } else {
      state.selectVerifier = verifier;
    }
  }
}
