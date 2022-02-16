import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plug/app/data/models/interface/interface.dart';
import 'package:plug/app/ui/pages/chain/export/proposal/proposal.controller.dart';

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
  DateTime? subimtStartTime; // 发起时间
  DateTime? fundEndTime; // 募资结束时间
  DateTime? vetingStartTime; // 开始投票时间
  DateTime? vetingEndTime; // 结束投票时间
  String description = ''; // 投票描述类型
  String totalBanalceVolume = ''; // 总投票者持有数量
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
  final EnumOptionStatus? choosed;
  // 投票数量
  final String? amount;
  HashInfo({
    required this.userAddress,
    required this.hash,
    required this.dateTime,
    this.choosed,
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
}

class ChainProposalDetailsPageController extends GetxController with GetSingleTickerProviderStateMixin {
  ChainProposalDetailsPageController();
  ChainProposalDetailsPageState state = ChainProposalDetailsPageState();
  TabController? listTabController;

  @override
  onInit() {
    super.onInit();
    String? id = Get.parameters['id'];
    if (id == null) return Get.back();
    _initGetData(id);
    state.baseCoinInfo.symbol = 'plugcn';
    state.baseCoinInfo.scale = 6;
    listTabController = TabController(length: 5, vsync: this);
  }
  

  // 获取信息
  _initGetData(String id) async {
    state.proposalInfo
      ..id = int.parse(id)
      ..title = 'Loweing Liquidity Pool crea tion Fee'
      ..status = EnumProposalStatus.passed
      ..sender = 'gx16kly35dsfxqd44q5y22xfy84aqgre656kl80qx'
      ..startBondVolume = '64000000'
      ..allBondVolume = '64000000'
      ..subimtStartTime = DateTime.tryParse('2021-09-08 00:45:46')
      ..fundEndTime = DateTime.tryParse('2021-09-08 00:45:46')
      ..vetingStartTime = DateTime.tryParse('2021-09-08 00:45:46')
      ..vetingEndTime = DateTime.tryParse('2021-09-08 00:45:46')
      ..description = '这是一项提案，旨在为集线器上的 IBC 包含一项新功能，该功能允许 ICS20 传输的多跳数据包路由。通过附加一个中间地址和最终目的地的端口/通道标识符，客户端将能够一次概述多个传输。'
      ..totalBanalceVolume = '94098320457822'
      ..agreeVolume = '93972118631452'
      ..rejectVolume = '5868023811'
      ..abandonVolume = '35822547113'
      ..vetoVolume = '2711033962';
      getList(1, 'ALL');
      getList(1, 'AGREE');
      getList(1, 'REJECT');
      getList(1, 'VETO');
      getList(1, 'ABANDON');
      getList(1, 'SUPPORTER');
  }
  getList(int page, String type) async {
    if (type == 'ALL') {
      state.allHashList.addAll(_formatListData());
    }
    if (type == 'AGREE') {
      state.agreeHashList.addAll(_formatListData());
    }
    if (type == 'REJECT') {
      state.rejectHashList.addAll(_formatListData());
    }
    if (type == 'VETO') {
      state.vetoHashList.addAll(_formatListData());
    }
    if (type == 'ABANDON') {
      state.abandonHashList.addAll(_formatListData());
    }
    if (type == 'SUPPORTER') {
      state.depositsHashList.addAll(_formatListData());
    }
  }
  List<HashInfo> _formatListData() {
    return [
      HashInfo(userAddress: 'gx15cycwdv3hyhdcvd8y8qrjmtd052g7rguq4czm3', hash: '0x258D52576E6936B0C98B93A65296E94EDF6CCC4E7C1EBAA1826BB2850D9DFCE3', dateTime: '2021-10-14 14:58:00', choosed: EnumOptionStatus.agree, amount: '20000.00'),
      HashInfo(userAddress: 'gx15cycwdv3hyhdcvd8y8qrjmtd052g7rguq4czm3', hash: '0x258D52576E6936B0C98B93A65296E94EDF6CCC4E7C1EBAA1826BB2850D9DFCE3', dateTime: '2021-10-14 14:58:00', choosed: EnumOptionStatus.abandon, amount: '20000.00'),
      HashInfo(userAddress: 'gx15cycwdv3hyhdcvd8y8qrjmtd052g7rguq4czm3', hash: '0x258D52576E6936B0C98B93A65296E94EDF6CCC4E7C1EBAA1826BB2850D9DFCE3', dateTime: '2021-10-14 14:58:00', choosed: EnumOptionStatus.veto, amount: '20000.00'),
      HashInfo(userAddress: 'gx15cycwdv3hyhdcvd8y8qrjmtd052g7rguq4czm3', hash: '0x258D52576E6936B0C98B93A65296E94EDF6CCC4E7C1EBAA1826BB2850D9DFCE3', dateTime: '2021-10-14 14:58:00', choosed: EnumOptionStatus.reject, amount: '20000.00'),
      HashInfo(userAddress: 'gx15cycwdv3hyhdcvd8y8qrjmtd052g7rguq4czm3', hash: '0x258D52576E6936B0C98B93A65296E94EDF6CCC4E7C1EBAA1826BB2850D9DFCE3', dateTime: '2021-10-14 14:58:00', choosed: EnumOptionStatus.agree, amount: '20000.00'),
    ];
  }


  // 转换比例
  String getVolumeRate(String volume) {
    double allVolume = double.tryParse(state.proposalInfo.totalBanalceVolume)??1;
    double douVolume = double.tryParse(volume)??0;
    if (allVolume == 0) allVolume = 1;
    return ((douVolume / allVolume) * 100).toStringAsFixed(4);
  }
}