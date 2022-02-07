import 'package:dotted_line/dotted_line.dart';
import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plug/app/ui/components/function/button.component.dart';
import 'package:plug/app/ui/components/function/input.component.dart';
import 'package:plug/app/ui/components/layout/scroll.component.dart';
import 'package:plug/app/ui/pages/chain/export/proposal/proposal.controller.dart';
import 'package:plug/app/ui/theme/theme.dart';

class ChainExportProposalPage extends GetView<ChainExportProposalPageController> {
  const ChainExportProposalPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ChainExportProposalPageController());
    ChainExportProposalPageState state = controller.state;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(padding: EdgeInsets.only(top: appTheme.sizes.paddingSmall)),
        LInput(
          inputHeight: appTheme.sizes.basic * 80,
          radiusCircular: true,
          fillColor: appTheme.colors.pageBackgroundColor,
          hintText: '搜索提案ID/标题'.tr,
          textInputAction: TextInputAction.search,
          textController: state.searchController,
          onSubmitted: controller.onSearchProposal,
          prefixIcon: Icon(
            Icons.search_outlined,
            size: appTheme.sizes.iconSize * 0.9,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            top: appTheme.sizes.paddingSmall,
            bottom: appTheme.sizes.paddingSmall,
          ),
          child: Text('提案列表'.tr, style: TextStyle(color: appTheme.colors.textBlackBig, fontWeight: FontWeight.bold, fontSize: appTheme.sizes.fontSizeBig)),
        ),
        Expanded(
          child: LScrollView(
            onRefresh: controller.onGetData,
            child: Obx(() => Column(
              children: [
                for (ProposalCardInfo _item in state.proposalList)
                  Stack(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: appTheme.sizes.paddingSmall, left: appTheme.sizes.paddingSmall * 0.5),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: appTheme.colors.pageBackgroundColor,
                            borderRadius: BorderRadius.all(Radius.circular(appTheme.sizes.radius)),
                          ),
                          clipBehavior: Clip.antiAlias,
                          padding: EdgeInsets.only(
                            right: appTheme.sizes.padding,
                            left: appTheme.sizes.padding,
                            bottom: appTheme.sizes.paddingSmall,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              InkWell(
                                onTap: () => controller.onGoToProposalDetail(_item),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Padding(padding: EdgeInsets.only(top: appTheme.sizes.padding * 2)),
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: Column(
                                            children: [
                                              Text('#${_item.id} ${_item.title}', style: const TextStyle(fontWeight: FontWeight.bold)),
                                              Padding(padding: EdgeInsets.only(top: appTheme.sizes.paddingSmall)),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Padding(
                                                        padding: EdgeInsets.only(bottom: appTheme.sizes.paddingSmall * 0.5),
                                                        child: Text('quorumVolume'.tr, style: Get.textTheme.bodyText1),
                                                      ),
                                                      Text('${_item.needVotingRate}%', style: const TextStyle(fontWeight: FontWeight.bold))
                                                    ]
                                                  ),
                                                  Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Padding(
                                                        padding: EdgeInsets.only(bottom: appTheme.sizes.paddingSmall * 0.5, left: appTheme.sizes.paddingSmall),
                                                        child: Text('mainTendency'.tr, style: Get.textTheme.bodyText1),
                                                      ),
                                                      Row(
                                                        children: [
                                                          SizedBox(
                                                            width: 20,
                                                            height: 18,
                                                            child: Icon(Icons.arrow_right, color: appTheme.colors.primaryColor, size: 18),
                                                          ),
                                                          Text(
                                                            (
                                                              _item.passedVolumeForVoting > _item.rejectedVolumeForVoting ? 'agree'.tr : (
                                                                _item.passedVolumeForVoting == _item.rejectedVolumeForVoting ? 'equilibrium'.tr : 'reject'.tr
                                                              )
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ]
                                                  ),
                                                ]
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(padding: EdgeInsets.only(left: appTheme.sizes.padding)),
                                        Container(
                                          width: appTheme.sizes.basic * 150,
                                          height: appTheme.sizes.basic * 150,
                                          padding: EdgeInsets.all(appTheme.sizes.paddingSmall),
                                          child: CustomPaint(
                                            painter: _VotingProgress(info: _item),
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(bottom: appTheme.sizes.paddingSmall * 0.5),
                                child: DottedLine(dashColor: appTheme.colors.borderColor,),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('proposalEndTime'.tr, style: Get.textTheme.bodyText1),
                                      Text(DateUtil.formatDate(_item.closeTime), style: Get.textTheme.bodyText1!.copyWith(color: appTheme.colors.textGrayBig))
                                    ]
                                  ),
                                  (
                                    _item.status == EnumProposalStatus.votingPeriod ?
                                    InkWell(
                                      child: Icon(
                                        Icons.more_horiz,
                                        size: 28,
                                        color: _item.isOpenFunc ? appTheme.colors.textGray : appTheme.colors.primaryColor,
                                      ),
                                      onTap: () => controller.onToogleFunc(_item),
                                    ) :
                                    Text(
                                      (_item.status == EnumProposalStatus.deposit ? '' : 'complete'.tr),
                                      style: TextStyle(fontSize: 12, color: appTheme.colors.textGray),
                                    )
                                  )
                                ],
                              ),
                              Offstage(
                                offstage: !_item.isOpenFunc,
                                child: Container(
                                  padding: EdgeInsets.only(top: appTheme.sizes.paddingSmall),
                                  decoration: BoxDecoration(color: appTheme.colors.pageBackgroundColor),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      LButton(
                                        onPressed: () => controller.onAbandon(_item),
                                        child: Text('abandon'.tr,),
                                        radius: true,
                                        height: 26,
                                        contrast: true,
                                      ),
                                      LButton(
                                        onPressed: () => controller.onVeto(_item),
                                        child: Text('veto'.tr),
                                        radius: true,
                                        height: 26,
                                        contrast: true,
                                      ),
                                      LButton(
                                        onPressed: () => controller.onAgree(_item),
                                        child: Text('agree'.tr),
                                        radius: true,
                                        height: 26,
                                      ),
                                      LButton(
                                        onPressed: () => controller.onReject(_item),
                                        child: Text('reject'.tr),
                                        radius: true,
                                        height: 26,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        top: 3,
                        left: 0,
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: appTheme.sizes.paddingSmall * 0.5, vertical: appTheme.sizes.paddingSmall * 0.2),
                          decoration: BoxDecoration(
                            color: (() {
                              if (_item.status == EnumProposalStatus.passed) return appTheme.colors.primaryColor;
                              if (_item.status == EnumProposalStatus.rejected || _item.status == EnumProposalStatus.failed) {
                                return appTheme.colors.errorColor;
                              } else {
                                return appTheme.colors.textGray;
                              }
                            })(),
                            borderRadius: BorderRadius.horizontal(right: Radius.circular(appTheme.sizes.radius)),
                          ),
                          child: Text(
                            statusMap[_item.status]!,
                            style: TextStyle(color: appTheme.colors.hightColor, fontSize: 10),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 3,
                        right: 5,
                        child: Icon(
                          Icons.shuffle_sharp,
                          size: appTheme.sizes.fontSize,
                          color: appTheme.colors.textGray,
                        ),
                      ),
                    ],
                  )
              ],
            )),
          ),
        ),
      ],
    );
  }
}


class _VotingProgress extends CustomPainter {
  _VotingProgress({
    required this.info,
  }) {
    double allVolume = info.abandonVolumeForVoting + info.passedVolumeForVoting + info.rejectedVolumeForVoting;
    _agreeRatePi = (info.passedVolumeForVoting / allVolume) * (3.1415926 * 2);
    _abandonRatePi = (info.abandonVolumeForVoting / allVolume) * (3.1415926 * 2);
    _rejectRatePi = (info.rejectedVolumeForVoting / allVolume) * (3.1415926 * 2);
  }

  Paint bgPaint = Paint()
    ..color = appTheme.colors.borderColor
    ..strokeWidth = 15
    ..isAntiAlias = true
    ..style = PaintingStyle.stroke;
  Paint ratePaint = Paint()
    ..strokeWidth = 15
    ..isAntiAlias = true
    ..style = PaintingStyle.stroke
    ..strokeCap = StrokeCap.butt;

  final ProposalCardInfo info;
  late double _agreeRatePi;
  late double _abandonRatePi;
  late double _rejectRatePi;

  @override
  paint(Canvas canvas, Size size) {
    // bg
    canvas.drawCircle(Offset(size.width / 2, size.height / 2), size.width / 2, bgPaint);
    Rect rect = Rect.fromCircle(
        center: Offset(size.width / 2, size.height / 2), radius: size.width / 2);
    // agree
    ratePaint.color = appTheme.colors.primaryColor;
    canvas.drawArc(rect, 0, _agreeRatePi, false, ratePaint);
    // abandon
    ratePaint.color = appTheme.colors.borderColor;
    canvas.drawArc(rect, _agreeRatePi, _abandonRatePi, false, ratePaint);
    // reject
    ratePaint.color = appTheme.colors.errorColor;
    canvas.drawArc(rect, _abandonRatePi + _agreeRatePi, _rejectRatePi, false, ratePaint);
  }

  @override
  shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}