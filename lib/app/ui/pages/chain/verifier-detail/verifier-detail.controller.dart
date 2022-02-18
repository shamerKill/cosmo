import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plug/app/data/models/interface/interface.dart';
import 'package:plug/app/routes/routes.dart';
import 'package:plug/app/ui/components/function/bottomSheet.component.dart';

class ChainVerifierDetailPageState {
  // 验证者信息
  final Rx<UserVerifierModel> _verifierInfo =UserVerifierModel().obs;
  UserVerifierModel get verifierInfo => _verifierInfo.value;
  set verifierInfo (UserVerifierModel value) => _verifierInfo.value = value;
  // 基础币信息
  final Rx<TokenModel> _baseCoinInfo = TokenModel().obs;
  TokenModel get baseCoinInfo => _baseCoinInfo.value;
  set baseCoinInfo (TokenModel value) => _baseCoinInfo.value = value;
  // 显示已质押状态的按钮
  final Rx<bool> _showPledgedState = false.obs;
  bool get showPledgedState => _showPledgedState.value;
  set showPledgedState (bool value) => _showPledgedState.value = value;
  // 显示未质押状态的按钮
  final Rx<bool> _showNoPledgeState = false.obs;
  bool get showNoPledgeState => _showNoPledgeState.value;
  set showNoPledgeState (bool value) => _showNoPledgeState.value = value;
}

class ChainVerifierDetailPageController extends GetxController {
  ChainVerifierDetailPageController();
  ChainVerifierDetailPageState state = ChainVerifierDetailPageState();

  @override
  onInit() {
    super.onInit();
    String? address = Get.parameters['address'];
    if (address == null) return Get.back();
    String? type = Get.parameters['type'];
    if (type == '1') {
      state.showPledgedState = true;
    } else if (type == '0') {
      state.showNoPledgeState = true;
    }
    _getData();
  }

  _getData() {
    state.verifierInfo..address = 'gxjioasdjfasldgkjoi123jioldsajfgolasdjgio'
      ..avatar = 'http://via.placeholder.com/43x46'
      ..nickName = 'zhiyayihao'
      ..status = VerifierStatusEnum.running
      ..allPledged = '2022248912345'
      ..yieldRate = '47.99'
      ..pledged = '100000'
      ..rePledging = '289124809123'
      ..redeeming = '123940125123'
      ..reward = '123124123'
      ..minPledgeVolume = '100000';
    state.baseCoinInfo..symbol = 'plugcn'
      ..scale = 6;
  }

  // 赎回质押
  onBackPledge() {
    Get.toNamed(PlugRoutesNames.chainBackupPledge(state.verifierInfo.address));
  }
  // 赎回收益
  onBackReward() async {
    var promptType = await LBottomSheet.promptBottomSheet(title: '赎回提示'.tr, message: Text('是否需要赎回全部收益?'.tr));
    if (promptType != true) return;
    var passwrod = await LBottomSheet.passwordBottomSheet();
  }
  // 转质押
  onRePledge() {
    Get.toNamed(PlugRoutesNames.chainRePledge(state.verifierInfo.address));
  }
  // 质押
  onPledge() {
    Get.toNamed(PlugRoutesNames.chainPledgeTransfer(state.verifierInfo.address));
  }
}