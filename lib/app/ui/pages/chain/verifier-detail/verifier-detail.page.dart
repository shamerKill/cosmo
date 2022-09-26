import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plug/app/data/models/interface/interface.dart';
import 'package:plug/app/ui/components/function/button.component.dart';
import 'package:plug/app/ui/components/layout/appbar.component.dart';
import 'package:plug/app/ui/components/layout/scaffold.component.dart';
import 'package:plug/app/ui/components/layout/scroll.component.dart';
import 'package:plug/app/ui/components/view/image.component.dart';
import 'package:plug/app/ui/components/view/verifierCard.component.dart';
import 'package:plug/app/ui/pages/chain/verifier-detail/verifier-detail.controller.dart';
import 'package:plug/app/ui/theme/theme.dart';
import 'package:plug/app/ui/utils/number.dart';
import 'package:plug/app/ui/utils/string.dart';

class ChainVerifierDetailPage
    extends GetView<ChainVerifierDetailPageController> {
  const ChainVerifierDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ChainVerifierDetailPageState state = controller.state;

    return LScaffold(
      statusBar: LAppBar.defaultStatus(),
      headerBar: LAppBar.defaultHeader(),
      titleBar: LAppBar.defaultTitle(
        title: Row(
          children: [
            Container(
              padding: EdgeInsets.all(appTheme.sizes.basic * 5.0),
              decoration: BoxDecoration(
                border: Border.all(color: appTheme.colors.borderColor),
                borderRadius: BorderRadius.all(
                    Radius.circular(appTheme.sizes.basic * 50)),
              ),
              child: Obx(() => LViewImage(
                    width: appTheme.sizes.basic * 50.0,
                    height: appTheme.sizes.basic * 50.0,
                    url: state.verifierInfo.avatar,
                    bgColor:
                        StringTool.stringToColor(state.verifierInfo.address),
                    isRadius: true,
                  )),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(
                    left: appTheme.sizes.paddingSmall,
                    right: appTheme.sizes.paddingSmall),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Obx(() => Text(state.verifierInfo.nickName,
                      style: TextStyle(
                          color: appTheme.colors.textBlackBig,
                          fontWeight: FontWeight.bold))),
                ),
              ),
            ),
            Obx(() => LVerifierStatusNode(verifier: state.verifierInfo)),
          ],
        ),
      ),
      basicBackgroundColor: true,
      body: LScrollView(
        onRefresh: controller.onRefresh,
        refreshController: controller.refreshController,
        child: Column(children: [
          Padding(padding: EdgeInsets.only(top: appTheme.sizes.padding)),
          Container(
            width: appTheme.sizes.infinity,
            padding: EdgeInsets.symmetric(
              horizontal: appTheme.sizes.padding,
              vertical: appTheme.sizes.padding,
            ),
            decoration: BoxDecoration(
              borderRadius:
                  BorderRadius.all(Radius.circular(appTheme.sizes.radius)),
              color: appTheme.colors.pageBackgroundColor,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                        padding:
                            EdgeInsets.only(top: appTheme.sizes.paddingSmall)),
                    Text('verifier'.tr,
                        style: TextStyle(color: appTheme.colors.textGrayBig)),
                    Padding(
                        padding: EdgeInsets.only(
                            bottom: appTheme.sizes.paddingSmall * 0.5)),
                    Obx(() => Text(state.verifierInfo.address,
                        style: TextStyle(color: appTheme.colors.primaryColor))),
                    Padding(
                        padding: EdgeInsets.only(
                            bottom: appTheme.sizes.paddingSmall)),
                    DottedLine(
                      dashColor: appTheme.colors.borderColor,
                    ),
                  ],
                ),
                Obx(() => Visibility(
                      visible: state.verifierInfo.reward != '',
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                              padding: EdgeInsets.only(
                                  top: appTheme.sizes.paddingSmall)),
                          Text('reward'.tr,
                              style: TextStyle(
                                  color: appTheme.colors.textGrayBig)),
                          Padding(
                              padding: EdgeInsets.only(
                                  bottom: appTheme.sizes.paddingSmall * 0.5)),
                          Text(NumberTool.formatNumberStr(
                                  NumberTool.amountToBalance(
                                      state.verifierInfo.reward)) +
                              ' ' +
                              state.baseCoinInfo.symbol),
                          Padding(
                              padding: EdgeInsets.only(
                                  bottom: appTheme.sizes.paddingSmall)),
                          DottedLine(
                            dashColor: appTheme.colors.borderColor,
                          ),
                        ],
                      ),
                    )),
                Obx(() => Visibility(
                      visible: state.verifierInfo.pledged != '',
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                              padding: EdgeInsets.only(
                                  top: appTheme.sizes.paddingSmall)),
                          Text('myPledge'.tr,
                              style: TextStyle(
                                  color: appTheme.colors.textGrayBig)),
                          Padding(
                              padding: EdgeInsets.only(
                                  bottom: appTheme.sizes.paddingSmall * 0.5)),
                          Text(
                              NumberTool.formatNumberStr(
                                      NumberTool.amountToBalance(
                                          state.verifierInfo.pledged)) +
                                  ' ' +
                                  state.baseCoinInfo.symbol,
                              style: TextStyle(
                                  color: appTheme.colors.primaryColor)),
                          Padding(
                              padding: EdgeInsets.only(
                                  bottom: appTheme.sizes.paddingSmall)),
                          DottedLine(
                            dashColor: appTheme.colors.borderColor,
                          ),
                        ],
                      ),
                    )),
                Obx(() => Visibility(
                      visible: state.verifierInfo.rePledging != '',
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                              padding: EdgeInsets.only(
                                  top: appTheme.sizes.paddingSmall)),
                          Text('rePledgingVolume'.tr,
                              style: TextStyle(
                                  color: appTheme.colors.textGrayBig)),
                          Padding(
                              padding: EdgeInsets.only(
                                  bottom: appTheme.sizes.paddingSmall * 0.5)),
                          Text(
                              NumberTool.formatNumberStr(
                                      NumberTool.amountToBalance(
                                          state.verifierInfo.rePledging)) +
                                  ' ' +
                                  state.baseCoinInfo.symbol,
                              style: TextStyle(
                                  color: appTheme.colors.primaryColor)),
                          Padding(
                              padding: EdgeInsets.only(
                                  bottom: appTheme.sizes.paddingSmall)),
                          DottedLine(
                            dashColor: appTheme.colors.borderColor,
                          ),
                        ],
                      ),
                    )),
                Obx(() => Visibility(
                      visible: state.verifierInfo.redeeming != '',
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                              padding: EdgeInsets.only(
                                  top: appTheme.sizes.paddingSmall)),
                          Text('withdrawingVolume'.tr,
                              style: TextStyle(
                                  color: appTheme.colors.textGrayBig)),
                          Padding(
                              padding: EdgeInsets.only(
                                  bottom: appTheme.sizes.paddingSmall * 0.5)),
                          Text(
                              NumberTool.formatNumberStr(
                                      NumberTool.amountToBalance(
                                          state.verifierInfo.redeeming)) +
                                  ' ' +
                                  state.baseCoinInfo.symbol,
                              style: TextStyle(
                                  color: appTheme.colors.primaryColor)),
                          Padding(
                              padding: EdgeInsets.only(
                                  bottom: appTheme.sizes.paddingSmall)),
                          DottedLine(
                            dashColor: appTheme.colors.borderColor,
                          ),
                        ],
                      ),
                    )),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                        padding:
                            EdgeInsets.only(top: appTheme.sizes.paddingSmall)),
                    Text('pledgedVolumeWithVerifier'.tr,
                        style: TextStyle(color: appTheme.colors.textGrayBig)),
                    Padding(
                        padding: EdgeInsets.only(
                            bottom: appTheme.sizes.paddingSmall * 0.5)),
                    Obx(() => Text(NumberTool.formatNumberStr(
                            NumberTool.amountToBalance(
                                state.verifierInfo.allPledged)) +
                        ' ' +
                        state.baseCoinInfo.symbol)),
                    Padding(
                        padding: EdgeInsets.only(
                            bottom: appTheme.sizes.paddingSmall)),
                    DottedLine(
                      dashColor: appTheme.colors.borderColor,
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                        padding:
                            EdgeInsets.only(top: appTheme.sizes.paddingSmall)),
                    Text('minVolumeForPledge'.tr,
                        style: TextStyle(color: appTheme.colors.textGrayBig)),
                    Padding(
                        padding: EdgeInsets.only(
                            bottom: appTheme.sizes.paddingSmall * 0.5)),
                    Obx(() => Text(NumberTool.formatNumberStr(
                            NumberTool.amountToBalance(
                                state.verifierInfo.minPledgeVolume)) +
                        ' ' +
                        state.baseCoinInfo.symbol)),
                    Padding(
                        padding: EdgeInsets.only(
                            bottom: appTheme.sizes.paddingSmall)),
                    DottedLine(
                      dashColor: appTheme.colors.borderColor,
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                        padding:
                            EdgeInsets.only(top: appTheme.sizes.paddingSmall)),
                    Text('yearYieldRate'.tr,
                        style: TextStyle(color: appTheme.colors.textGrayBig)),
                    Padding(
                        padding: EdgeInsets.only(
                            bottom: appTheme.sizes.paddingSmall * 0.5)),
                    Obx(() => Text(state.verifierInfo.yieldRate)),
                    Padding(
                        padding: EdgeInsets.only(
                            bottom: appTheme.sizes.paddingSmall)),
                    DottedLine(
                      dashColor: appTheme.colors.borderColor,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
              padding: EdgeInsets.only(bottom: appTheme.sizes.padding * 2.0)),
          Obx(() => Visibility(
                visible: state.showPledgedState && state.accountInfo.accountClass != EnumAccountClass.watch,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: LButton(
                            child: Text('withdrawPledged'.tr),
                            onPressed: controller.onBackPledge,
                          ),
                        ),
                        Padding(
                            padding:
                                EdgeInsets.only(left: appTheme.sizes.padding)),
                        Expanded(
                          flex: 1,
                          child: LButton(
                            child: Text('withdrawReward'.tr),
                            onPressed: controller.onBackReward,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                        padding: EdgeInsets.only(
                            bottom: appTheme.sizes.paddingSmall)),
                    LButton(
                      child: Text('rePledge'.tr),
                      onPressed: controller.onRePledge,
                      width: appTheme.sizes.infinity,
                    ),
                    Padding(
                        padding: EdgeInsets.only(
                            bottom: appTheme.sizes.paddingSmall)),
                    LButton(
                      child: Text('addPledge'.tr),
                      onPressed: controller.onPledge,
                      contrast: true,
                      width: appTheme.sizes.infinity,
                    ),
                  ],
                ),
              )),
          Obx(() => Visibility(
                visible: state.showNoPledgeState && state.accountInfo.accountClass != EnumAccountClass.watch,
                child: Column(
                  children: [
                    Padding(
                        padding: EdgeInsets.only(
                            bottom: appTheme.sizes.paddingSmall)),
                    LButton(
                      child: Text('pledge'.tr),
                      onPressed: controller.onPledge,
                      width: appTheme.sizes.infinity,
                    ),
                  ],
                ),
              ))
        ]),
      ),
    );
  }
}
