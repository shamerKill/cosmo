import 'package:get/get.dart';
import 'package:plug/app/data/models/interface/interface.dart';
import 'package:plug/app/routes/routes.dart';
import 'package:plug/app/ui/components/function/loading.component.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ChainVerifiersPageState {
  // 质押节点列表
  final RxList<UserVerifierModel> verifiesList = RxList();
  // 当前第几页
  final Rx<int> _listPage = 1.obs;
  int get listPage => _listPage.value;
  set listPage (int value) => _listPage.value = value;
}

class ChainVerifiersPageController extends GetxController {
  ChainVerifiersPageController();
  ChainVerifiersPageState state = ChainVerifiersPageState();
  RefreshController verifiersRefreshController = RefreshController();

  @override
  onInit() {
    super.onInit();
    _getData();
  }

  @override
  onClose() {
    LLoading.dismiss();
  }

  _getData() {
    state.verifiesList.add(
      UserVerifierModel()..address = 'gxjioasdjfasldgkjoi123jioldsajfgolasdjgio'
        ..avatar = 'http://via.placeholder.com/43x46'
        ..nickName = 'zhiyayihao'
        ..status = VerifierStatusEnum.running
        ..allPledged = '2022248912345'
        ..yieldRate = '47.99'
        ..pledged = '100000'
        ..rePledging = '289124809123'
        ..redeeming = '123940125123'
        ..reward = '123124123'
    );
    state.verifiesList.add(
      UserVerifierModel()..address = 'gxjioasdjfasldgkjoi123jioldsajfgolasdjgio'
        ..avatar = 'http://via.placeholder.com/43x46'
        ..status = VerifierStatusEnum.offLine
        ..nickName = 'zhuanqianzhuanqian'
        ..allPledged = '100000'
        ..yieldRate = '47.99'
    );
    state.verifiesList.refresh();
  }

  // 刷新事件
  Future<void> onRefreshListener() async {
    await Future.delayed(const Duration(seconds: 2));
    state.verifiesList.clear();
    _getData();
  }
  // 加载更多事件
  Future<void> onLoadListener() async {
    await Future.delayed(const Duration(seconds: 2));
    _getData();
  }
  // 验证者查看详情
  onVerifierDetailListener(UserVerifierModel verifier) {
    Get.toNamed(PlugRoutesNames.chainVerifierDetail(verifier.address, verifier.pledged != null ? '1' : '0'));
  }
}