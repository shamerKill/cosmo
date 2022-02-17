import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:plug/app/data/models/interface/interface.dart';
import 'package:plug/app/routes/routes.dart';
import 'package:plug/app/ui/components/function/bottomSheet.component.dart';
import 'package:plug/app/ui/components/function/loading.component.dart';
import 'package:plug/app/ui/components/function/toast.component.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ChainRePledgePageState {
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
  // 是否在转质押等待中
  final Rx<bool> _pledgeLoading = false.obs;
  bool get pledgeLoading => _pledgeLoading.value;
  set pledgeLoading (bool value) => _pledgeLoading.value = value;
  // 所有节点列表
  RxList<UserVerifierModel> allVerifiers = RxList();
  // 节点分页
  final Rx<int> _allVerifiersPage = 1.obs;
  int get allVerifiersPage => _allVerifiersPage.value;
  set allVerifiersPage (int value) => _allVerifiersPage.value = value;
  // 选中的节点
  final Rx<UserVerifierModel> _selectVerifier = UserVerifierModel().obs;
  UserVerifierModel get selectVerifier => _selectVerifier.value;
  set selectVerifier (UserVerifierModel value) => _selectVerifier.value = value;
}

class ChainRePledgePageController extends GetxController {
  ChainRePledgePageController();
  ChainRePledgePageState state = ChainRePledgePageState();
  // 转质押数量输入值
  TextEditingController pledgeController = TextEditingController(text: '0');
  RefreshController verifiersRefreshController = RefreshController();


  @override
  onInit() {
    super.onInit();
    String? address = Get.parameters['address'];
    if (address == null) return Get.back();
    _initData();
  }

  // 初始化数据
  _initData() {
    state.veriferInfo..address = 'gxjioasdjfasldgkjoi123jioldsajfgolasdjgio'
      ..avatar = 'http://via.placeholder.com/43x46'
      ..nickName = 'zhiyayihao'
      ..status = VerifierStatusEnum.running
      ..allPledged = '100000'
      ..yieldRate = '47.99'
      ..pledged = '2022248912345'
      ..rePledging = '289124809123'
      ..redeeming = '123940125123'
      ..reward = '123124123'
      ..minPledgVolume = '10';
    state.baseCoin..symbol = 'PLUGCN' ..scale = 6 ..amount = '100000';
    state.feeAmount = '200';
    getAllVerifiersList();
  }
  // 获取分页数据
  Future<void> getAllVerifiersList() async {
    state.allVerifiers.addAll([
      state.veriferInfo..address += '1',
      state.veriferInfo..address += '2',
      state.veriferInfo..address += '3',
      state.veriferInfo..address += '4',
      state.veriferInfo..address += '5',
      state.veriferInfo..address += '6',
    ]);
    state.allVerifiersPage++;
  }
  // 刷新列表
  Future<void> onRefreshVerifiersList() async {
    getAllVerifiersList();
  }
  // 查看节点详情
  onVerifierDetailListener(UserVerifierModel verifier) {
    Get.toNamed(PlugRoutesNames.chainVerifierDetailNull(verifier.address));
  }
  //  转让质押监听
  onPledgeListener() async {
    String? pass = await LBottomSheet.passwordBottomSheet();
    print(pass);
    state.pledgeLoading = true;
    LLoading.showBgLoading();
    await Future.delayed(const Duration(seconds: 5));
    LLoading.dismiss();
    state.pledgeLoading = false;
    LToast.success('转让质押完成'.tr);
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