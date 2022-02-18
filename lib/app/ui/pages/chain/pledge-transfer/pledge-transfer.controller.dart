import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plug/app/data/models/interface/interface.dart';
import 'package:plug/app/ui/components/function/bottomSheet.component.dart';
import 'package:plug/app/ui/components/function/loading.component.dart';
import 'package:plug/app/ui/components/function/toast.component.dart';

class ChainPledgeTransferPageState {
  // 节点信息
  final Rx<UserVerifierModel> _veriferInfo = UserVerifierModel().obs;
  UserVerifierModel get veriferInfo => _veriferInfo.value;
  set veriferInfo (UserVerifierModel value) => _veriferInfo.value = value;
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

  @override
  onInit() {
    super.onInit();
    String? address = Get.parameters['address'];
    if (address == null) return Get.back();
    _initData();
  }

  @override
  onClose() {
    LLoading.dismiss();
  }

  // 初始化数据
  _initData() {
    state._veriferInfo.value..address = 'gxjioasdjfasldgkjoi123jioldsajfgolasdjgio'
      ..avatar = 'http://via.placeholder.com/43x46'
      ..nickName = 'zhiyayihao'
      ..status = VerifierStatusEnum.running
      ..allPledged = '100000'
      ..yieldRate = '47.99'
      ..pledged = '2022248912345'
      ..rePledging = '289124809123'
      ..redeeming = '123940125123'
      ..reward = '123124123'
      ..minPledgeVolume = '10';
    state.baseCoin..symbol = 'PLUGCN' ..scale = 6 ..amount = '100000';
    state.feeAmount = '200';
  }

  // 质押监听
  onPledgeListener() async {
    String? pass = await LBottomSheet.passwordBottomSheet();
    print(pass);
    state.pledgeLoading = true;
    LLoading.showBgLoading();
    await Future.delayed(const Duration(seconds: 5));
    LLoading.dismiss();
    state.pledgeLoading = false;
    LToast.success('质押完成'.tr);
  }
}