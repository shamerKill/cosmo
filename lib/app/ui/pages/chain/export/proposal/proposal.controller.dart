import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:plug/app/routes/routes.dart';

enum EnumProposalStatus {
  votingPeriod, // 投票中
  passed, // 通过
  rejected, // 拒绝
  unspecified, // 未定义
  deposit, // 筹款中
  failed, // 失败
}
Map<EnumProposalStatus, String> statusMap = {
  EnumProposalStatus.votingPeriod: 'proposalIng'.tr,
  EnumProposalStatus.passed: 'passedType'.tr,
  EnumProposalStatus.rejected: 'rejectType'.tr,
  EnumProposalStatus.unspecified: 'undefinedType'.tr,
  EnumProposalStatus.deposit: 'depositType'.tr,
  EnumProposalStatus.failed: 'failedType'.tr,
};

class ProposalCardInfo {
  final EnumProposalStatus status; // 状态
  final int id; // id
  final String title; // 标题
  final String needVotingRate; // 法定人数比例
  final double passedVolumeForVoting; // 通过人数
  final double rejectedVolumeForVoting; // 拒绝人数
  final double abandonVolumeForVoting; // 弃权人数
  final DateTime closeTime; // 结束时间
  bool isOpenFunc = false; // 是否展开了操作框
  ProposalCardInfo({
    required this.status,
    required this.id,
    required this.title,
    required this.needVotingRate,
    required this.passedVolumeForVoting,
    required this.rejectedVolumeForVoting,
    required this.abandonVolumeForVoting,
    required this.closeTime,
  });
}

class ChainExportProposalPageState {
  // 当前页数/0代表没有更多
  final Rx<int> _nowPage = 1.obs;
  int get nowPage => _nowPage.value;
  set nowPage (int value) => _nowPage.value = value;
  // 提案列表
  RxList<ProposalCardInfo> proposalList = RxList();
  // 搜索controller
  final Rx<TextEditingController> _searchController = TextEditingController().obs;
  TextEditingController get searchController => _searchController.value;
  set searchController (TextEditingController value) => _searchController.value = value;
}

class ChainExportProposalPageController extends GetxController {
  ChainExportProposalPageController();
  ChainExportProposalPageState state = ChainExportProposalPageState();

  @override
  onInit() {
    super.onInit();
    onGetData();
  }

  // 获取内容
  Future<void> onGetData() async{
    state.proposalList.addAll([
      ProposalCardInfo(
        status: EnumProposalStatus.votingPeriod, id: 1, title: 'Loweing Liquidity Poaol creation Fee',
        needVotingRate: '10.00', passedVolumeForVoting: 8010.00, rejectedVolumeForVoting: 9090.00,
        abandonVolumeForVoting: 9902, closeTime: DateTime.now(),
      ),
      ProposalCardInfo(
        status: EnumProposalStatus.passed, id: 2, title: 'Loweing Liquidity Pool creation Fee',
        needVotingRate: '10.00', passedVolumeForVoting: 8010.00, rejectedVolumeForVoting: 900.00,
        abandonVolumeForVoting: 9902, closeTime: DateTime.now(),
      ),
      ProposalCardInfo(
        status: EnumProposalStatus.rejected, id: 3, title: 'Loweing Liquidity Pool creation Fee',
        needVotingRate: '10.00', passedVolumeForVoting: 8010.00, rejectedVolumeForVoting: 9090.00,
        abandonVolumeForVoting: 902, closeTime: DateTime.now(),
      ),
      ProposalCardInfo(
        status: EnumProposalStatus.votingPeriod, id: 4, title: 'Loweing Liquidity Pool creation Fee',
        needVotingRate: '10.00', passedVolumeForVoting: 8010.00, rejectedVolumeForVoting: 9090.00,
        abandonVolumeForVoting: 9902, closeTime: DateTime.now(),
      ),
      ProposalCardInfo(
        status: EnumProposalStatus.votingPeriod, id: 4, title: 'Loweing Liquidity Pool creation Fee',
        needVotingRate: '10.00', passedVolumeForVoting: 8010.00, rejectedVolumeForVoting: 9090.00,
        abandonVolumeForVoting: 9902, closeTime: DateTime.now(),
      ),
    ]);
  }

  // 搜索内容
  onSearchProposal(String text) {
    print(text);
  }
  // 前往提案详情
  onGoToProposalDetail(ProposalCardInfo info) {
    Get.toNamed(PlugRoutesNames.chainProposalDetails('${info.id}'));
  }
  // 展开/关闭操作框
  onToogleFunc(ProposalCardInfo info) {
    info.isOpenFunc = !info.isOpenFunc;
    state.proposalList.refresh();
  }
  // 弃权
  onAbandon(ProposalCardInfo info) {
  }
  // 否决
  onReject(ProposalCardInfo info) {
  }
  // 赞同
  onAgree(ProposalCardInfo info) {
  }
  // 反对
  onVeto(ProposalCardInfo info) {
  }
}