import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plug/app/ui/components/layout/appbar.component.dart';
import 'package:plug/app/ui/components/layout/scaffold.component.dart';
import 'package:plug/app/ui/pages/chain/export/proposal/proposal.controller.dart';
import 'package:plug/app/ui/pages/chain/proposalDetails/proposalDetails.controller.dart';
import 'package:plug/app/ui/theme/theme.dart';
import 'package:plug/app/ui/utils/number.dart';
import 'package:plug/app/ui/utils/string.dart';

class ChainProposalDetailsPage
    extends GetView<ChainProposalDetailsPageController> {
  const ChainProposalDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ChainProposalDetailsPageState state = controller.state;

    return LScaffold(
      statusBar: LAppBar.defaultStatus(),
      headerBar: LAppBar.defaultHeader(),
      basicBackgroundColor: true,
      singleScroll: true,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Obx(() => Text(
              '#${state.proposalInfo.id}\n${state.proposalInfo.title}',
              style: TextStyle(
                  color: appTheme.colors.textBlackBig,
                  fontSize: appTheme.sizes.fontSizeBig,
                  fontWeight: FontWeight.bold))),
          Padding(padding: EdgeInsets.only(top: appTheme.sizes.paddingSmall)),
          Obx(() => Container(
                padding: EdgeInsets.symmetric(
                    horizontal: appTheme.sizes.paddingSmall,
                    vertical: appTheme.sizes.basic * 5),
                decoration: BoxDecoration(
                  color: (() {
                    if (state.proposalInfo.status == EnumProposalStatus.passed)
                      return appTheme.colors.primaryColor.withOpacity(0.2);
                    if (state.proposalInfo.status ==
                        EnumProposalStatus.rejected)
                      return appTheme.colors.errorColor.withOpacity(0.2);
                    return appTheme.colors.textGrayBig.withOpacity(0.2);
                  })(),
                  borderRadius:
                      BorderRadius.all(Radius.circular(appTheme.sizes.radius)),
                ),
                child: Text(statusMap[state.proposalInfo.status]!,
                    style: TextStyle(
                        color: (() {
                          if (state.proposalInfo.status ==
                              EnumProposalStatus.passed)
                            return appTheme.colors.primaryColor;
                          if (state.proposalInfo.status ==
                              EnumProposalStatus.rejected)
                            return appTheme.colors.errorColor;
                          return appTheme.colors.textGrayBig;
                        })(),
                        fontSize: appTheme.sizes.fontSizeSmall,
                        fontWeight: FontWeight.bold)),
              )),
          Padding(padding: EdgeInsets.only(top: appTheme.sizes.paddingSmall)),
          Container(
            width: appTheme.sizes.infinity,
            padding: EdgeInsets.symmetric(
                horizontal: appTheme.sizes.paddingSmall,
                vertical: appTheme.sizes.paddingSmall / 2),
            decoration: BoxDecoration(
              color: appTheme.colors.pageBackgroundColor,
              borderRadius:
                  BorderRadius.all(Radius.circular(appTheme.sizes.radius)),
              border: Border.all(color: appTheme.colors.borderColor),
            ),
            child: Builder(builder: (_) {
              Widget getList({
                String title = '',
                String info = '',
                bool? isAddress,
                int? maxLines,
                TextStyle? textStyle,
              }) {
                return Padding(
                  padding: EdgeInsets.only(
                      top: appTheme.sizes.paddingSmall / 2,
                      bottom: appTheme.sizes.paddingSmall / 2),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              bottom: appTheme.sizes.basic * 5.0),
                          child: Text(title, style: Get.textTheme.bodyText1),
                        ),
                        Text(
                          isAddress == true
                              ? StringTool.hideAddressCenter(info)
                              : info,
                          style: textStyle ??
                              const TextStyle(fontWeight: FontWeight.w500),
                          maxLines: maxLines,
                        ),
                      ]),
                );
              }

              return Obx(() => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      getList(
                          title: 'proposer'.tr,
                          info: state.proposalInfo.sender),
                      getList(
                          title: 'initBound'.tr,
                          info: NumberTool.amountToBalance(
                              state.proposalInfo.startBondVolume)),
                      getList(
                          title: 'allBound'.tr,
                          info: NumberTool.amountToBalance(
                              state.proposalInfo.allBondVolume)),
                      getList(
                          title: 'submitTime'.tr,
                          info: DateUtil.formatDate(
                              state.proposalInfo.submitStartTime)),
                      getList(
                          title: 'moneyEndTime'.tr,
                          info: DateUtil.formatDate(
                              state.proposalInfo.fundEndTime)),
                      getList(
                          title: 'proposalStartTime'.tr,
                          info: DateUtil.formatDate(
                              state.proposalInfo.votingStartTime)),
                      getList(
                          title: 'proposalEndTime'.tr,
                          info: DateUtil.formatDate(
                              state.proposalInfo.votingEndTime)),
                      getList(
                          title: 'proposalDescription'.tr,
                          info: state.proposalInfo.description,
                          textStyle:
                              TextStyle(color: appTheme.colors.textGrayBig)),
                    ],
                  ));
            }),
          ),
          Padding(
            padding:
                EdgeInsets.symmetric(vertical: appTheme.sizes.paddingSmall),
            child: Obx(() => Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(text: '${'totalProposalVolume'.tr}: '),
                      TextSpan(
                          text:
                              '${NumberTool.formatNumberStr(NumberTool.amountToBalance(state.proposalInfo.totalBalanceVolume, scale: state.baseCoinInfo.scale))} ${state.baseCoinInfo.symbol}',
                          style: TextStyle(
                              fontSize: appTheme.sizes.fontSizeSmall)),
                    ],
                  ),
                  style: TextStyle(
                      fontSize: appTheme.sizes.fontSize,
                      color: appTheme.colors.textBlackBig),
                )),
          ),
          Container(
            width: appTheme.sizes.infinity,
            padding: EdgeInsets.symmetric(
                horizontal: appTheme.sizes.paddingSmall,
                vertical: appTheme.sizes.paddingSmall / 2),
            decoration: BoxDecoration(
              color: appTheme.colors.pageBackgroundColor,
              borderRadius:
                  BorderRadius.all(Radius.circular(appTheme.sizes.radius)),
              border: Border.all(color: appTheme.colors.borderColor),
            ),
            child: Builder(builder: (_) {
              rateItem(
                String text,
                Color color,
                String rate,
                String volume,
              ) {
                return Padding(
                  padding: EdgeInsets.only(top: appTheme.sizes.paddingSmall),
                  child: Row(
                    children: [
                      Container(
                        height: appTheme.sizes.basic * 80.0,
                        width: appTheme.sizes.basic * 5.0,
                        decoration: BoxDecoration(color: color),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.only(left: appTheme.sizes.paddingSmall),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(text),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: appTheme.sizes.basic * 5.0),
                                child: Text('$rate%'),
                              ),
                              Text(
                                '${NumberTool.formatNumberStr(volume)} ${state.baseCoinInfo.symbol}',
                                style: TextStyle(
                                    color: appTheme.colors.textGray,
                                    fontSize: appTheme.sizes.fontSizeSmall),
                              ),
                            ]),
                      ),
                    ],
                  ),
                );
              }

              return Obx(() => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      rateItem(
                          'agree'.tr,
                          appTheme.colors.proposalAgree,
                          controller
                              .getVolumeRate(state.proposalInfo.agreeVolume),
                          state.proposalInfo.agreeVolume),
                      rateItem(
                          'reject'.tr,
                          appTheme.colors.proposalReject,
                          controller
                              .getVolumeRate(state.proposalInfo.rejectVolume),
                          state.proposalInfo.rejectVolume),
                      rateItem(
                          'veto'.tr,
                          appTheme.colors.proposalVeto,
                          controller
                              .getVolumeRate(state.proposalInfo.vetoVolume),
                          state.proposalInfo.vetoVolume),
                      rateItem(
                          'abandon'.tr,
                          appTheme.colors.proposalAbandon,
                          controller
                              .getVolumeRate(state.proposalInfo.abandonVolume),
                          state.proposalInfo.abandonVolume),
                    ],
                  ));
            }),
          ),
          Padding(
            key: controller.vetoTitleKey,
            padding:
                EdgeInsets.symmetric(vertical: appTheme.sizes.paddingSmall),
            child: Text(
              'vote'.tr,
              style: TextStyle(
                  fontSize: appTheme.sizes.fontSizeBig,
                  color: appTheme.colors.textBlackBig),
            ),
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(
                horizontal: appTheme.sizes.paddingSmall / 2,
                vertical: appTheme.sizes.paddingSmall / 2),
            decoration: BoxDecoration(
              color: appTheme.colors.pageBackgroundColor,
              borderRadius:
                  BorderRadius.all(Radius.circular(appTheme.sizes.radius)),
              border: Border.all(color: appTheme.colors.borderColor),
            ),
            child: Column(
              children: [
                TabBar(
                  controller: controller.listTabController,
                  labelColor: appTheme.colors.textBlack,
                  unselectedLabelColor:
                      appTheme.colors.textBlack.withOpacity(0.6),
                  indicatorColor: appTheme.colors.primaryColor,
                  isScrollable: true,
                  tabs: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: appTheme.sizes.paddingSmall),
                      child: Obx(() =>
                          Text('${'all'.tr}(${state.allHashTotalLength})')),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: appTheme.sizes.paddingSmall),
                      child: Obx(() =>
                          Text('${'agree'.tr}(${state.agreeHashTotalLength})')),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: appTheme.sizes.paddingSmall),
                      child: Obx(() => Text(
                          '${'reject'.tr}(${state.rejectHashTotalLength})')),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: appTheme.sizes.paddingSmall),
                      child: Obx(() =>
                          Text('${'veto'.tr}(${state.vetoHashTotalLength})')),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: appTheme.sizes.paddingSmall),
                      child: Obx(() => Text(
                          '${'abandon'.tr}(${state.abandonHashTotalLength})')),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: appTheme.sizes.paddingSmall),
                ),
                Obx(() => state.vetoTabViewHeight == 0.0
                    ? Container()
                    : SizedBox(
                        height: state.vetoTabViewHeight,
                        width: appTheme.sizes.infinity,
                        child: TabBarView(
                            controller: controller.listTabController,
                            children: [
                              Obx(() => Column(
                                    children: [
                                      for (var value in state.allHashList)
                                        _ProposalVoterItem(value),
                                      Padding(
                                          padding: EdgeInsets.only(
                                              bottom: appTheme.sizes.padding)),
                                      _ProposalVoterRow(
                                          getList: controller.getList,
                                          nowPage: state.allHashPage,
                                          allPageTotal: state.allHashTotalPage,
                                          type: 'ALL'),
                                    ],
                                  )),
                              Obx(() => Column(
                                    children: [
                                      for (var value in state.agreeHashList)
                                        _ProposalVoterItem(value),
                                      Padding(
                                          padding: EdgeInsets.only(
                                              bottom: appTheme.sizes.padding)),
                                      _ProposalVoterRow(
                                          getList: controller.getList,
                                          nowPage: state.agreeHashPage,
                                          allPageTotal:
                                              state.agreeHashTotalPage,
                                          type: 'AGREE'),
                                    ],
                                  )),
                              Obx(() => Column(
                                    children: [
                                      for (var value in state.rejectHashList)
                                        _ProposalVoterItem(value),
                                      Padding(
                                          padding: EdgeInsets.only(
                                              bottom: appTheme.sizes.padding)),
                                      _ProposalVoterRow(
                                          getList: controller.getList,
                                          nowPage: state.rejectHashPage,
                                          allPageTotal:
                                              state.rejectHashTotalPage,
                                          type: 'REJECT'),
                                    ],
                                  )),
                              Obx(() => Column(
                                    children: [
                                      for (var value in state.vetoHashList)
                                        _ProposalVoterItem(value),
                                      Padding(
                                          padding: EdgeInsets.only(
                                              bottom: appTheme.sizes.padding)),
                                      _ProposalVoterRow(
                                          getList: controller.getList,
                                          nowPage: state.vetoHashPage,
                                          allPageTotal:
                                              state.rejectHashTotalPage,
                                          type: 'VETO'),
                                    ],
                                  )),
                              Obx(() => Column(
                                    children: [
                                      for (var value in state.abandonHashList)
                                        _ProposalVoterItem(value),
                                      Padding(
                                          padding: EdgeInsets.only(
                                              bottom: appTheme.sizes.padding)),
                                      _ProposalVoterRow(
                                          getList: controller.getList,
                                          nowPage: state.abandonHashPage,
                                          allPageTotal:
                                              state.abandonHashTotalPage,
                                          type: 'ABANDON'),
                                    ],
                                  )),
                            ]),
                      )),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: appTheme.sizes.padding),
            child: Text(
              'depositor'.tr,
              style: TextStyle(
                  fontSize: appTheme.sizes.fontSizeBig,
                  color: appTheme.colors.textBlackBig),
            ),
          ),
          Obx(() => Offstage(
                offstage: state.depositsHashList.isEmpty,
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                      horizontal: appTheme.sizes.padding,
                      vertical: appTheme.sizes.paddingSmall),
                  decoration: BoxDecoration(
                    color: appTheme.colors.pageBackgroundColor,
                    borderRadius: BorderRadius.all(
                        Radius.circular(appTheme.sizes.radius)),
                    border: Border.all(color: appTheme.colors.borderColor),
                  ),
                  child: Column(
                    children: [
                      for (var value in state.depositsHashList)
                        _ProposalDepositorItem(value)
                    ],
                  ),
                ),
              )),
        ],
      ),
    );
  }
}

class _ProposalVoterItem extends StatelessWidget {
  final HashInfo info;
  late final String _statusStr;
  late final Color _statusColor;

  _ProposalVoterItem(this.info) {
    if (info.chosen == EnumOptionStatus.abandon) {
      _statusStr = 'abandon'.tr;
      _statusColor = appTheme.colors.proposalAbandon;
    }
    if (info.chosen == EnumOptionStatus.agree) {
      _statusStr = 'agree'.tr;
      _statusColor = appTheme.colors.proposalAgree;
    }
    if (info.chosen == EnumOptionStatus.reject) {
      _statusStr = 'reject'.tr;
      _statusColor = appTheme.colors.proposalReject;
    }
    if (info.chosen == EnumOptionStatus.veto) {
      _statusStr = 'veto'.tr;
      _statusColor = appTheme.colors.errorColor;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: appTheme.sizes.paddingSmall),
      child: Container(
        padding: EdgeInsets.symmetric(
            vertical: appTheme.sizes.paddingSmall,
            horizontal: appTheme.sizes.paddingSmall),
        decoration: BoxDecoration(
          color: appTheme.colors.pageBackgroundColorBasic.withOpacity(0.4),
          border: Border.all(color: appTheme.colors.borderColor),
          borderRadius:
              BorderRadius.all(Radius.circular(appTheme.sizes.radius)),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  StringTool.hideAddressCenter(info.userAddress),
                  style: TextStyle(
                    color: appTheme.colors.primaryColor,
                  ),
                ),
                Text(_statusStr,
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: _statusColor)),
              ],
            ),
            Padding(
              padding:
                  EdgeInsets.symmetric(vertical: appTheme.sizes.paddingSmall),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'hash'.tr,
                    style: Get.textTheme.bodyText1,
                  ),
                  Text(StringTool.hideAddressCenter(info.hash)),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'time'.tr,
                  style: Get.textTheme.bodyText1,
                ),
                Text(info.dateTime, style: Get.textTheme.bodyText1),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _ProposalVoterRow extends StatelessWidget {
  final Function(int page, String type) getList;
  final int nowPage;
  final int allPageTotal;
  final String type;
  const _ProposalVoterRow({
    required this.getList,
    required this.nowPage,
    required this.allPageTotal,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _ProposalPageIconButton(
          icon: Icons.first_page,
          onPressed: () {
            getList(1, type);
          },
        ),
        Padding(padding: EdgeInsets.only(left: appTheme.sizes.padding)),
        _ProposalPageIconButton(
          icon: Icons.navigate_before,
          onPressed: () {
            getList(nowPage - 1, type);
          },
        ),
        Padding(padding: EdgeInsets.only(left: appTheme.sizes.padding)),
        Expanded(
          flex: 1,
          child: Container(
            height: 33.0,
            decoration: BoxDecoration(
              color: appTheme.colors.pageBackgroundColor,
              border: Border.all(color: appTheme.colors.borderColor),
              borderRadius:
                  BorderRadius.all(Radius.circular(appTheme.sizes.basic * 5.0)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '$nowPage / $allPageTotal',
                  textAlign: TextAlign.center,
                  style: Get.textTheme.bodyText1,
                ),
              ],
            ),
          ),
        ),
        Padding(padding: EdgeInsets.only(left: appTheme.sizes.padding)),
        _ProposalPageIconButton(
          icon: Icons.navigate_next,
          onPressed: () {
            getList(nowPage + 1, type);
          },
        ),
        Padding(padding: EdgeInsets.only(left: appTheme.sizes.padding)),
        _ProposalPageIconButton(
          icon: Icons.last_page,
          onPressed: () {
            getList(allPageTotal, type);
          },
        ),
      ],
    );
  }
}

class _ProposalPageIconButton extends StatelessWidget {
  final IconData icon;
  final void Function()? onPressed;

  const _ProposalPageIconButton({
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: appTheme.sizes.basic * 50.0,
      height: appTheme.sizes.basic * 50.0,
      decoration: BoxDecoration(
        border: Border.all(color: appTheme.colors.borderColor),
        borderRadius:
            BorderRadius.all(Radius.circular(appTheme.sizes.basic * 5.0)),
        color: appTheme.colors.pageBackgroundColor,
      ),
      child: IconButton(
        padding: EdgeInsets.all(appTheme.sizes.zero),
        iconSize: appTheme.sizes.basic * 30.0,
        color: appTheme.colors.textGray,
        icon: Icon(icon),
        onPressed: onPressed,
      ),
    );
  }
}

class _ProposalDepositorItem extends StatelessWidget {
  final HashInfo info;

  const _ProposalDepositorItem(this.info);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: appTheme.sizes.paddingSmall),
      child: Container(
        padding: EdgeInsets.symmetric(
            vertical: appTheme.sizes.paddingSmall,
            horizontal: appTheme.sizes.paddingSmall),
        decoration: BoxDecoration(
          color: appTheme.colors.pageBackgroundColor,
          border: Border.all(color: appTheme.colors.borderColor),
          borderRadius:
              BorderRadius.all(Radius.circular(appTheme.sizes.basic * 5.0)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              StringTool.hideAddressCenter(info.userAddress),
              style: TextStyle(
                color: appTheme.colors.primaryColor,
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.symmetric(vertical: appTheme.sizes.basic * 2.0),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'volume'.tr,
                  style: Get.textTheme.bodyText1,
                ),
                Text(NumberTool.formatNumberStr(info.amount ?? '')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
