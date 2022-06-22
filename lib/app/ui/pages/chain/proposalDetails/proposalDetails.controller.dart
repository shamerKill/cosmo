import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plug/app/data/models/interface/interface.dart';
import 'package:plug/app/data/provider/data.account.dart';
import 'package:plug/app/data/provider/data.base-coin.dart';
import 'package:plug/app/ui/components/function/loading.component.dart';
import 'package:plug/app/ui/pages/chain/export/proposal/proposal.controller.dart';
import 'package:plug/app/data/services/net.services.dart';
import 'package:plug/app/ui/utils/number.dart';

// 投票内容
class _ProposalCardInfo {
  EnumProposalStatus status = EnumProposalStatus.votingPeriod; // 状态
  int id = 0; // id
  String title = ''; // 标题
  String needVotingRate = ''; // 法定人数比例
  double passedVolumeForVoting = 0.0; // 通过人数
  double rejectedVolumeForVoting = 0.0; // 拒绝人数
  double abandonVolumeForVoting = 0.0; // 弃权人数
  DateTime? closeTime; // 结束时间
  String sender = ''; // 发起者
  String startBondVolume = ''; // 初始保证金
  String allBondVolume = ''; // 总保证金
  DateTime? submitStartTime; // 发起时间
  DateTime? fundEndTime; // 募资结束时间
  DateTime? votingStartTime; // 开始投票时间
  DateTime? votingEndTime; // 结束投票时间
  String description = ''; // 投票描述类型
  String totalBalanceVolume = ''; // 总投票者持有数量
  String agreeVolume = ''; // 赞同数量
  String rejectVolume = ''; // 反对数量
  String abandonVolume = ''; // 放弃数量
  String vetoVolume = ''; // 否决数量
  _ProposalCardInfo();
}
// 投票交易信息
class HashInfo {
  // 交易用户地址
  final String userAddress;
  // hash
  final String hash;
  // 时间
  final String dateTime;
  // 投票类型
  final EnumOptionStatus? chosen;
  // 投票数量
  final String? amount;
  HashInfo({
    required this.userAddress,
    required this.hash,
    required this.dateTime,
    this.chosen,
    this.amount,
  });
}
// 投票类型
enum EnumOptionStatus {
  agree, // 同意
  abandon, // 弃权
  reject, // 不同意
  veto, // 否决
}
Map<String, EnumOptionStatus> _mapOptionStatus = {
  'VOTE_OPTION_YES': EnumOptionStatus.agree,
  'VOTE_OPTION_NO': EnumOptionStatus.abandon,
  'VOTE_OPTION_ABSTAIN': EnumOptionStatus.reject,
  'VOTE_OPTION_NO_WITH_VETO': EnumOptionStatus.veto,
};

class ChainProposalDetailsPageState {
  // 基础代币信息
  final Rx<TokenModel> _baseCoinInfo = TokenModel().obs;
  TokenModel get baseCoinInfo => _baseCoinInfo.value;
  set baseCoinInfo (TokenModel value) => _baseCoinInfo.value = value;
  // 提案详情信息
  final Rx<_ProposalCardInfo> _proposalInfo = _ProposalCardInfo().obs;
  _ProposalCardInfo get proposalInfo => _proposalInfo.value;
  set proposalInfo (_ProposalCardInfo value) => _proposalInfo.value = value;
  // 所有投票列表页数
  final Rx<int> _allHashPage = 1.obs;
  int get allHashPage => _allHashPage.value;
  set allHashPage (int value) => _allHashPage.value = value;
  // 所有投票列表总页数
  final Rx<int> _allHashTotalPage = 1.obs;
  int get allHashTotalPage => _allHashTotalPage.value;
  set allHashTotalPage (int value) => _allHashTotalPage.value = value;
  // 所有投票列表总条数
  final Rx<int> _allHashTotalLength = 0.obs;
  int get allHashTotalLength => _allHashTotalLength.value;
  set allHashTotalLength (int value) => _allHashTotalLength.value = value;
  // 所有投票列表
  final RxList<HashInfo> allHashList = RxList();
  // 赞同投票列表页数
  final Rx<int> _agreeHashPage = 1.obs;
  int get agreeHashPage => _agreeHashPage.value;
  set agreeHashPage (int value) => _agreeHashPage.value = value;
  // 赞同投票列表总页数
  final Rx<int> _agreeHashTotalPage = 1.obs;
  int get agreeHashTotalPage => _agreeHashTotalPage.value;
  set agreeHashTotalPage (int value) => _agreeHashTotalPage.value = value;
  // 赞同投票列表总条数
  final Rx<int> _agreeHashTotalLength = 0.obs;
  int get agreeHashTotalLength => _agreeHashTotalLength.value;
  set agreeHashTotalLength (int value) => _agreeHashTotalLength.value = value;
  // 赞同投票列表
  final RxList<HashInfo> agreeHashList = RxList();
  // 不赞同投票页数
  final Rx<int> _rejectHashPage = 1.obs;
  int get rejectHashPage => _rejectHashPage.value;
  set rejectHashPage (int value) => _rejectHashPage.value = value;
  // 不赞同投票总页数
  final Rx<int> _rejectHashTotalPage = 1.obs;
  int get rejectHashTotalPage => _rejectHashTotalPage.value;
  set rejectHashTotalPage (int value) => _rejectHashTotalPage.value = value;
  // 不赞同投票列表总页数
  final Rx<int> _rejectHashTotalLength = 0.obs;
  int get rejectHashTotalLength => _rejectHashTotalLength.value;
  set rejectHashTotalLength (int value) => _rejectHashTotalLength.value = value;
  // 不赞同投票列表
  final RxList<HashInfo> rejectHashList = RxList();
  // 否定投票页数
  final Rx<int> _vetoHashPage = 1.obs;
  int get vetoHashPage => _vetoHashPage.value;
  set vetoHashPage (int value) => _vetoHashPage.value = value;
  // 否定投票总页数
  final Rx<int> _vetoHashTotalPage = 1.obs;
  int get vetoHashTotalPage => _vetoHashTotalPage.value;
  set vetoHashTotalPage (int value) => _vetoHashTotalPage.value = value;
  // 否定投票总条数
  final Rx<int> _vetoHashTotalLength = 0.obs;
  int get vetoHashTotalLength => _vetoHashTotalLength.value;
  set vetoHashTotalLength (int value) => _vetoHashTotalLength.value = value;
  // 否定投票列表
  final RxList<HashInfo> vetoHashList = RxList();
  // 弃权投票页数
  final Rx<int> _abandonHashPage = 1.obs;
  int get abandonHashPage => _abandonHashPage.value;
  set abandonHashPage (int value) => _abandonHashPage.value = value;
  // 弃权投票总页数
  final Rx<int> _abandonHashTotalPage = 1.obs;
  int get abandonHashTotalPage => _abandonHashTotalPage.value;
  set abandonHashTotalPage (int value) => _abandonHashTotalPage.value = value;
  // 弃权投票总条数
  final Rx<int> _abandonHashTotalLength = 0.obs;
  int get abandonHashTotalLength => _abandonHashTotalLength.value;
  set abandonHashTotalLength (int value) => _abandonHashTotalLength.value = value;
  // 弃权投票列表
  final RxList<HashInfo> abandonHashList = RxList();
  // 存款人列表
  final RxList<HashInfo> depositsHashList = RxList();
  // 投票页面高度
  final Rx<double> _vetoTabViewHeight = 0.0.obs;
  double get vetoTabViewHeight => _vetoTabViewHeight.value;
  set vetoTabViewHeight (double value) => _vetoTabViewHeight.value = value;
}

class ChainProposalDetailsPageController extends GetxController with GetTickerProviderStateMixin {
  ChainProposalDetailsPageController();
  ChainProposalDetailsPageState state = ChainProposalDetailsPageState();
  TabController? listTabController;

  // 高度Key
  GlobalKey vetoTitleKey = GlobalKey();

  DataCoinsController dataCoins = Get.find();
  DataAccountController dataAccount = Get.find();

  @override
  onInit() {
    super.onInit();
    listTabController = TabController(length: 5, vsync: this);
  }

  @override
  onReady() async {
    String? id = Get.parameters['id'];
    if (id == null) return Get.back();
    state.baseCoinInfo = dataCoins.state.baseCoin;
    try {
      await _initGetData(id);
      _getVetoHeight();
    } catch (e) {
      Get.back();
    }
  }

  // 获取高度
  _getVetoHeight() {
    var _height = vetoTitleKey.currentContext?.size?.height??0.0;
    if (_height == 0.0) return Future.delayed(const Duration(milliseconds: 1000), _getVetoHeight);
    state.vetoTabViewHeight = _height * 14.0;
  }
  

  // 获取信息
  _initGetData(String id) async {
    var res = await Future.wait([
      httpToolApp.getChainProposalDetail(id),
      httpToolApp.getChainProposalDetailTally(id),
      httpToolApp.getChainProposalDetailProposer(id),
    ]);
    var resultData = res[0].data;
    var resultTally = res[1];
    var resultProposer = res[2];
    double memYesVolume = double.parse(resultTally.data['tally']['yes']);
    double memNoVolume = double.parse(resultTally.data['tally']['no']);
    double memAbstainVolume = double.parse(resultTally.data['tally']['abstain']);
    double memVetoVolume = double.parse(resultTally.data['tally']['no_with_veto']);
    double memAllVolume = memYesVolume + memNoVolume + memAbstainVolume + memVetoVolume;
    EnumProposalStatus memStatus = (() {
      switch (resultData['status']) {
        case 'PROPOSAL_STATUS_UNSPECIFIED': return EnumProposalStatus.unspecified;
        case 'PROPOSAL_STATUS_DEPOSIT_PERIOD': return EnumProposalStatus.deposit;
        case 'PROPOSAL_STATUS_VOTING_PERIOD': return EnumProposalStatus.votingPeriod;
        case 'PROPOSAL_STATUS_PASSED': return EnumProposalStatus.passed;
        case 'PROPOSAL_STATUS_REJECTED': return EnumProposalStatus.rejected;
        case 'PROPOSAL_STATUS_FAILED': return EnumProposalStatus.failed;
        default: return EnumProposalStatus.unspecified;
      }
    })();
    double memAllAmount = (() {
      double allAmount = 0;
      for (int i = 0; i < resultData['total_deposit'].length; i++) {
        allAmount += double.tryParse(resultData['total_deposit'][i]['amount'])??0;
      }
      return allAmount;
    })();
    state.proposalInfo
      ..id = int.parse(id)
      ..title = resultData['content']['title']
      ..status = memStatus
      ..sender = resultProposer.data['result']['proposer']
      ..startBondVolume = NumberTool.amountToBalance(resultData['total_deposit'][0]['amount'])
      ..allBondVolume = NumberTool.amountToBalance('$memAllAmount')
      ..submitStartTime = DateTime.parse(resultData['submit_time'])
      ..fundEndTime = DateTime.parse(resultData['deposit_end_time'])
      ..votingStartTime = DateTime.parse(resultData['voting_start_time'])
      ..votingEndTime = DateTime.parse(resultData['voting_end_time'])
      ..description = resultData['content']['description']
      ..totalBalanceVolume = NumberTool.amountToBalance('$memAllVolume')
      ..agreeVolume = NumberTool.amountToBalance('$memYesVolume')
      ..rejectVolume = NumberTool.amountToBalance('$memNoVolume')
      ..abandonVolume = NumberTool.amountToBalance('$memAbstainVolume')
      ..vetoVolume = NumberTool.amountToBalance('$memVetoVolume');
    state._proposalInfo.refresh();
    await Future.wait([
      getList(1, 'ALL'),
      getList(1, 'AGREE'),
      getList(1, 'REJECT'),
      getList(1, 'VETO'),
      getList(1, 'ABANDON'),
      getList(1, 'SUPPORTER'),
    ]);
  }
  Future<void> getList(int page, String type) async {
    if (type == 'ALL') {
      if (page > state.allHashTotalPage) return;
      state.allHashList.clear();
      state.allHashList.addAll(await _getAllVoteList(page));
    }
    if (type == 'AGREE') {
      if (page > state.agreeHashTotalPage) return;
      state.agreeHashList.clear();
      state.agreeHashList.addAll(await _getAgreeVoteList(page));
    }
    if (type == 'REJECT') {
      if (page > state.rejectHashTotalPage) return;
      state.rejectHashList.clear();
      state.rejectHashList.addAll(await _getRejectVoteList(page));
    }
    if (type == 'VETO') {
      if (page > state.vetoHashTotalPage) return;
      state.vetoHashList.clear();
      state.vetoHashList.addAll(await _getVetoVoteList(page));
    }
    if (type == 'ABANDON') {
      if (page > state.abandonHashTotalPage) return;
      state.abandonHashList.clear();
      state.abandonHashList.addAll(await _getAbandonVoteList(page));
    }
    if (type == 'SUPPORTER') {
      state.depositsHashList.clear();
      state.depositsHashList.addAll(await _getDepositsList(page));
    }
  }
  Future<List<HashInfo>> _getDepositsList(int page) async {
    var result = await httpToolApp.getChainProposalDetailDeposits(state.proposalInfo.id.toString());
    List<HashInfo> _list = [];
    for (var item in result.data['deposits']) {
      var allAmount = 0.0;
      for (var j = 0; j < item['amount'].length; j++) {
        allAmount += double.tryParse(item['amount'][j]['amount'])??0;
      }
      _list.add(HashInfo(
        userAddress: item['depositor'],
        hash: '',
        dateTime: '',
        amount: NumberTool.amountToBalance('$allAmount')
      ));
    }
    return _list;
  }
  Future<List<HashInfo>> _getAllVoteList(int page) async {
    LLoading.showLoading();
    var result = await _getVoteList(page);
    LLoading.dismiss();
    return result;
  }
  _getAgreeVoteList(int page) async {
    LLoading.showLoading();
    var result = await _getVoteList(page, type: 'VOTE_OPTION_YES');
    LLoading.dismiss();
    return result;
  }
  _getRejectVoteList(int page) async {
    LLoading.showLoading();
    var result = await _getVoteList(page, type: 'VOTE_OPTION_NO');
    LLoading.dismiss();
    return result;
  }
  _getVetoVoteList(int page) async {
    LLoading.showLoading();
    var result = await _getVoteList(page, type: 'VOTE_OPTION_NO_WITH_VETO');
    LLoading.dismiss();
    return result;
  }
  _getAbandonVoteList(int page) async {
    LLoading.showLoading();
    var result = await _getVoteList(page, type: 'VOTE_OPTION_ABSTAIN');
    LLoading.dismiss();
    return result;
  }
  Future<List<HashInfo>> _getVoteList(int page, { String? type }) async {
    var result = await httpToolApp.getChainProposalDetailVotes(state.proposalInfo.id.toString(), page, type: type, limit: 5);
    int totalValue = int.tryParse(result.data['pagination']['total'])??0;
    if (totalValue == 0) return [];
    int totalPage = (totalValue / 5).ceil();
    List<HashInfo> memList = [];
    for (int i = 0; i < result.data['tx_responses'].length; i++) {
      var item = result.data['tx_responses'][i];
      memList.add(HashInfo(
        userAddress: item['tx']['body']['messages'][0]['voter'],
        hash: item['txhash'],
        dateTime: DateUtil.formatDate(DateTime.tryParse(item['timestamp'])),
        chosen: _mapOptionStatus[item['tx']['body']['messages'][0]['option']],
      ));
    }
    if (type == null) {
      state.allHashTotalLength = totalValue;
      state.allHashTotalPage = totalPage;
      state.allHashPage = page;
    } else if (type == 'VOTE_OPTION_YES') {
      state.agreeHashTotalLength = totalValue;
      state.agreeHashTotalPage = totalPage;
      state.agreeHashPage = page;
    } else if (type == 'VOTE_OPTION_NO') {
      state.rejectHashTotalLength = totalValue;
      state.rejectHashTotalPage = totalPage;
      state.rejectHashPage = page;
    } else if (type == 'VOTE_OPTION_NO_WITH_VETO') {
      state.vetoHashTotalLength = totalValue;
      state.vetoHashTotalPage = totalPage;
      state.vetoHashPage = page;
    } else if (type == 'VOTE_OPTION_ABSTAIN') {
      state.abandonHashTotalLength = totalValue;
      state.abandonHashTotalPage = totalPage;
      state.abandonHashPage = page;
    }
    return memList;
  }


  // 转换比例
  String getVolumeRate(String volume) {
    double allVolume = double.tryParse(state.proposalInfo.totalBalanceVolume)??1;
    double douVolume = double.tryParse(volume)??0;
    if (allVolume == 0) allVolume = 1;
    return ((douVolume / allVolume) * 100).toStringAsFixed(4);
  }
}