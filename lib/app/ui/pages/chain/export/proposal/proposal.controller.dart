import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:plug/app/data/provider/data.account.dart';
import 'package:plug/app/data/provider/data.base-coin.dart';
import 'package:plug/app/routes/routes.dart';
import 'package:plug/app/ui/components/function/bottomSheet.component.dart';
import 'package:plug/app/ui/components/function/loading.component.dart';
import 'package:plug/app/ui/components/function/toast.component.dart';
import 'package:plug/app/data/services/net.services.dart';
import 'package:plug/app/ui/utils/number.dart';
import 'package:plug/app/ui/utils/wallet.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:alan/proto/cosmos/gov/v1beta1/gov.pb.dart' as gov;

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
  set nowPage(int value) => _nowPage.value = value;
  // 提案列表
  RxList<ProposalCardInfo> proposalList = RxList();
  // 搜索controller
  final Rx<TextEditingController> _searchController =
      TextEditingController().obs;
  TextEditingController get searchController => _searchController.value;
  set searchController(TextEditingController value) =>
      _searchController.value = value;
}

class ChainExportProposalPageController extends GetxController {
  ChainExportProposalPageController();
  ChainExportProposalPageState state = ChainExportProposalPageState();

  RefreshController proposalsRefreshController = RefreshController();

  DataCoinsController dataCoins = Get.find();
  DataAccountController dataAccount = Get.find();

  @override
  onReady() {
    onGetData();
  }

  // 获取内容
  Future<void> onGetData() async {
    int _limit = 5;
    var res = await Future.wait([
      httpToolApp.getChainProposalsList(state.nowPage, limit: _limit),
      httpToolApp.getTokenSupply(dataCoins.state.baseCoin.minUnit),
    ]);
    var result = res[0];
    var tokenSupply = res[1];
    if (result.status != 0) return;
    if (result.data.length < _limit) state.nowPage = 0;
    for (var item in result.data) {
      double yesVolume = double.parse(item['final_tally_result']['yes']);
      double noVolume = double.parse(item['final_tally_result']['no']);
      double abstainVolume =
          double.parse(item['final_tally_result']['abstain']);
      double vetoVolume =
          double.parse(item['final_tally_result']['no_with_veto']);
      double votingRate = (yesVolume + noVolume + abstainVolume + vetoVolume) /
          int.parse(tokenSupply.data ?? '1') *
          100;
      state.proposalList.add(ProposalCardInfo(
        status: (() {
          switch (item['status']) {
            case 'PROPOSAL_STATUS_UNSPECIFIED':
              return EnumProposalStatus.unspecified;
            case 'PROPOSAL_STATUS_DEPOSIT_PERIOD':
              return EnumProposalStatus.deposit;
            case 'PROPOSAL_STATUS_VOTING_PERIOD':
              return EnumProposalStatus.votingPeriod;
            case 'PROPOSAL_STATUS_PASSED':
              return EnumProposalStatus.passed;
            case 'PROPOSAL_STATUS_REJECTED':
              return EnumProposalStatus.rejected;
            case 'PROPOSAL_STATUS_FAILED':
              return EnumProposalStatus.failed;
            default:
              return EnumProposalStatus.unspecified;
          }
        })(),
        id: int.parse(item['proposal_id']),
        title: item['content']['title'],
        needVotingRate: votingRate.toStringAsFixed(2),
        passedVolumeForVoting: yesVolume,
        rejectedVolumeForVoting: noVolume,
        abandonVolumeForVoting: abstainVolume,
        closeTime: DateTime.parse(item['voting_end_time']),
      ));
    }
  }

  Future<void> onLoad() async {
    state.nowPage++;
    await onGetData();
  }

  Future<void> onRefresh() async {
    state.nowPage = 1;
    state.proposalList.clear();
    await onGetData();
  }

  // 前往提案详情
  onGoToProposalDetail(ProposalCardInfo info) {
    Get.toNamed(PlugRoutesNames.chainProposalDetails('${info.id}'));
  }

  // 展开/关闭操作框
  onToggleFunc(ProposalCardInfo info) {
    info.isOpenFunc = !info.isOpenFunc;
    state.proposalList.refresh();
  }

  // 弃权
  onAbandon(ProposalCardInfo info) =>
      _proposalPrompt(info, gov.VoteOption.VOTE_OPTION_ABSTAIN);
  // 反对
  onReject(ProposalCardInfo info) =>
      _proposalPrompt(info, gov.VoteOption.VOTE_OPTION_NO);
  // 赞同
  onAgree(ProposalCardInfo info) =>
      _proposalPrompt(info, gov.VoteOption.VOTE_OPTION_YES);
  // 否决
  onVeto(ProposalCardInfo info) =>
      _proposalPrompt(info, gov.VoteOption.VOTE_OPTION_NO_WITH_VETO);
  _proposalPrompt(ProposalCardInfo info, gov.VoteOption type) async {
    String s = '';
    switch (type) {
      case gov.VoteOption.VOTE_OPTION_ABSTAIN:
        s = 'abandon'.tr;
        break;
      case gov.VoteOption.VOTE_OPTION_NO:
        s = 'reject'.tr;
        break;
      case gov.VoteOption.VOTE_OPTION_YES:
        s = 'agree'.tr;
        break;
      case gov.VoteOption.VOTE_OPTION_NO_WITH_VETO:
        s = 'veto'.tr;
        break;
      case gov.VoteOption.VOTE_OPTION_UNSPECIFIED:
        s = 'veto'.tr;
        break;
    }
    var _type = await LBottomSheet.promptBottomSheet(
      title: 'voteTip'.tr,
      message: Text('send' + ' $s: #'.tr + info.id.toString()),
    );
    if (_type != true) return;
    var _pass = await LBottomSheet.passwordBottomSheet();
    if (_pass == null) return;
    LLoading.showBgLoading();
    var mnemonicList = await WalletTool.decryptMnemonic(
        dataAccount.state.nowAccount!.stringifyRaw, _pass);
    if (mnemonicList == null) {
      LLoading.dismiss();
      return LToast.warning('ErrorWithPasswordInput'.tr);
    }
    Get.focusScope?.unfocus();
    var _fee = await httpToolServer.getChainFee();
    var result = await WalletTool.proposalVote(
      mnemonic: mnemonicList,
      proposalId: info.id.toString(),
      option: type,
      gasAll: NumberTool.balanceToAmount(_fee.data ?? '0.0002'),
    );
    LLoading.dismiss();
    if (result.status == -10001) {
      return LToast.error('ErrorWithProposalCallback'.tr);
    }
    if (result.status == -10002) {
      return LToast.error('ErrorWithProposalTimeout'.tr);
    }
    if (result.status != 0) return LToast.error('ErrorWithProposalUnKnow'.tr);
    LToast.success('SuccessWithProposal'.tr);
  }
}
