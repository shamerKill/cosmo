import 'package:get/get.dart';
import 'package:plug/app/data/models/interface/interface.dart';
import 'package:plug/app/data/provider/data.account.dart';
import 'package:plug/app/routes/routes.dart';
import 'package:plug/app/ui/components/function/loading.component.dart';
import 'package:plug/app/data/services/net.services.dart';
import 'package:plug/app/ui/utils/number.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ChainVerifiersPageState {
  // 全部节点列表
  final RxList<UserVerifierModel> verifiesList = RxList();
  // 我的质押节点列表
  final RxList<UserVerifierModel> myPledgeList = RxList();
  // 是否获取过我的质押列表
  final Rx<bool> _initMyPledgeList = false.obs;
  bool get initMyPledgeList => _initMyPledgeList.value;
  set initMyPledgeList(bool value) => _initMyPledgeList.value = value;
  // 当前第几页
  final Rx<int> _listPage = 1.obs;
  int get listPage => _listPage.value;
  set listPage(int value) => _listPage.value = value;
}

class ChainVerifiersPageController extends GetxController {
  // 主网收益率
  String? chainRate;

  ChainVerifiersPageController();
  ChainVerifiersPageState state = ChainVerifiersPageState();
  DataAccountController dataAccount = Get.find();

  RefreshController verifiersRefreshController = RefreshController();

  @override
  onReady() {
    if (dataAccount.state.nowAccount == null) return Get.back();
    _getData();
  }

  @override
  onClose() {
    LLoading.dismiss();
  }

  _getData() async {
    chainRate ??= await httpToolApp.getChainRate();
    if (state.initMyPledgeList == false) {
      var _pledgeResult = await httpToolApp
          .getAccountDelegateData(dataAccount.state.nowAccount!.address);
      if (_pledgeResult != null &&
          _pledgeResult.status == 0 &&
          _pledgeResult.data['delegation_responses'] != null) {
        for (var _item in _pledgeResult.data['delegation_responses']) {
          state.myPledgeList.add(UserVerifierModel()
            ..address = _item['delegation']['validator_address']
            ..pledged = _item['balance']['amount']);
        }
        state.initMyPledgeList = true;
      }
    }
    var verifierList = await _getVerifierList();
    for (var _item in verifierList) {
      for (var _pledge in state.myPledgeList) {
        if (_pledge.address == _item.address) {
          _item.pledged = _pledge.pledged;
          break;
        }
      }
      state.verifiesList.add(_item);
    }
  }

  Future<List<UserVerifierModel>> _getVerifierList() async {
    var result =
        await httpToolApp.getChainVerifiersList(state.listPage, limit: 10);
    List<UserVerifierModel> list = [];
    if (result.status == 0) {
      if (result.data.length < 10) state.listPage = 0;
      for (var _item in result.data) {
        list.add(UserVerifierModel()
          ..address = _item['operator_address']
          ..setStatus(_item['status'])
          ..nickName = _item['description']['moniker']
          ..allPledged = _item['tokens']
          ..minPledgeVolume = _item['min_self_delegation']
          ..yieldRate = NumberTool.toPercentage(
              inputNum: double.parse(chainRate!) *
                  (1 -
                      double.parse(
                          _item['commission']['commission_rates']['rate']))));
      }
    }
    // 获取节点头像
    var avatarList = await httpToolServer
        .getChainVerifierAvatar(list.map((e) => e.address).toList());
    for (var element in list) {
      element.avatar = avatarList?.data[element.address] ?? '';
    }
    return list;
  }

  // 刷新事件
  Future<void> onRefreshListener() async {
    state.verifiesList.clear();
    state.listPage = 1;
    await _getData();
  }

  // 加载更多事件
  Future<void> onLoadListener() async {
    if (state.listPage == 0) return;
    state.listPage++;
    await _getData();
  }

  // 验证者查看详情
  onVerifierDetailListener(UserVerifierModel verifier) {
    Get.toNamed(PlugRoutesNames.chainVerifierDetail(
        verifier.address, verifier.pledged != '' ? '1' : '0'));
  }
}
