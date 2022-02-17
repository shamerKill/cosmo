import 'package:get/get.dart';
import 'package:plug/app/data/models/interface/interface.dart';
import 'package:plug/app/routes/routes.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ChainExportDelegatePageState {
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

  RefreshController delegateRefreshController = RefreshController();

  @override
  onInit() {
    super.onInit();
    initGetData();
  }

  // 获取数据
  Future<void> initGetData() async {
    state.delegatingAmount = '1998127459123';
    state.redeemingAmount = '1092341231234';
    state.rewardedAmount = '905324231';
    state.tokenInfo = TokenModel()..scale = 6;
    state.myDelegatedVerifiesList.add(
      UserVerifierModel()..address = 'gxjioasdjfasldgkjoi123jioldsajfgolasdjgio'
        ..avatar = 'http://via.placeholder.com/43x46'
        ..nickName = 'zhiyayihao'
        ..status = VerifierStatusEnum.running
        ..allPledged = '100000'
        ..yieldRate = '47.99'
        ..pledged = '2022248912345'
        ..rePledging = '289124809123'
        ..redeeming = '123940125123'
        ..reward = '123124123'
    );
    state.myDelegatedVerifiesList.add(
      UserVerifierModel()..address = 'gxjioasdjfasldgkjoi123jioldsajfgolasdjgio'
        ..avatar = 'http://via.placeholder.com/43x46'
        ..status = VerifierStatusEnum.offLine
        ..nickName = 'zhuanqianzhuanqian'
        ..allPledged = '100000'
        ..yieldRate = '47.99'
        ..pledged = '2022248912345'
        ..rePledging = '289124809123'
        ..redeeming = '123940125123'
        ..reward = '12312412312'
    );
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