import 'package:get/get.dart';
import 'package:plug/app/data/models/interface/interface.dart';

class ChainVerifierDetailInfoPageState {
  // 验证者信息
  final Rx<UserVerifierModel> _verifierInfo =UserVerifierModel().obs;
  UserVerifierModel get verifierInfo => _verifierInfo.value;
  set verifierInfo (UserVerifierModel value) => _verifierInfo.value = value;
  // 基础币信息
  final Rx<TokenModel> _baseCoinInfo = TokenModel().obs;
  TokenModel get baseCoinInfo => _baseCoinInfo.value;
  set baseCoinInfo (TokenModel value) => _baseCoinInfo.value = value;
}

class ChainVerifierDetailInfoPageController extends GetxController {
  ChainVerifierDetailInfoPageController();
  ChainVerifierDetailInfoPageState state = ChainVerifierDetailInfoPageState();

  @override
  onInit() {
    super.onInit();
    String? address = Get.parameters['address'];
    if (address == null) return Get.back();
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
      ..minPledgVolume = '100000';
    state.baseCoinInfo..symbol = 'plugcn'
      ..scale = 6;
  }
}