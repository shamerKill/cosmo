import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plug/app/data/models/interface/interface.dart';
import 'package:plug/app/ui/components/layout/scroll.component.dart';
import 'package:plug/app/ui/components/view/animation.component.dart';
import 'package:plug/app/ui/components/view/verifierCard.component.dart';
import 'package:plug/app/ui/pages/chain/export/delegate/delegate.controller.dart';
import 'package:plug/app/ui/theme/theme.dart';
import 'package:plug/app/ui/utils/number.dart';
import 'package:plug/app/ui/utils/string.dart';

class ChainExportDelegatePage extends GetView<ChainExportDelegatePageController> {
  const ChainExportDelegatePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ChainExportDelegatePageController());
    ChainExportDelegatePageState state = controller.state;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(padding: EdgeInsets.only(top: appTheme.sizes.paddingSmall)),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(appTheme.sizes.radius)),
          ),
          clipBehavior: Clip.antiAlias,
          child: Stack(
            children: [
              Container(
                width: appTheme.sizes.infinity,
                padding: EdgeInsets.only(top: appTheme.sizes.basic * 240),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(appTheme.sizes.radius)),
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: appTheme.colors.homeAssetsBg,
                  ),
                ),
                child: InkWell(
                  onTap: controller.onGoToVerifierList,
                  child: SizedBox(
                    height: appTheme.sizes.buttonHeight,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('验证者列表'.tr, style: TextStyle(color: appTheme.colors.hightColor)),
                        Padding(padding: EdgeInsets.only(right: appTheme.sizes.basic * 5.0)),
                        Icon(
                          const IconData(0xe60a, fontFamily: 'plugIcon'),
                          color: appTheme.colors.hightColor,
                          size: appTheme.sizes.basic * 18.0,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: appTheme.sizes.padding, horizontal: appTheme.sizes.padding),
                decoration: BoxDecoration(
                  color: appTheme.colors.pageBackgroundColor,
                  borderRadius: BorderRadius.all(Radius.circular(appTheme.sizes.radius)),
                ),
                clipBehavior: Clip.antiAlias,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('质押中'.tr, style: Get.textTheme.bodyText1),
                        Text('赎回中'.tr, style: Get.textTheme.bodyText1),
                      ],
                    ),
                    Padding(padding: EdgeInsets.only(top: appTheme.sizes.paddingSmall)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: LAnimationView(
                              child: Obx(() => Text(
                                NumberTool.formatNumberStr(NumberTool.amountToBalance(state.delegatingAmount, scale: state.tokenInfo.scale)),
                                style: TextStyle(color: appTheme.colors.primaryColor, fontSize: appTheme.sizes.fontSizeBig * 1.1, letterSpacing: -1 * appTheme.sizes.basic),
                              )),
                              randomKey: false,
                            ),
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(left: appTheme.sizes.padding)),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: LAnimationView(
                            child: Obx(() => Text(
                              NumberTool.formatNumberStr(NumberTool.amountToBalance(state.redeemingAmount, scale: state.tokenInfo.scale)),
                              style: TextStyle(color: appTheme.colors.textBlackBig, fontSize: appTheme.sizes.fontSizeBig * 1.1, letterSpacing: -1 * appTheme.sizes.basic),
                            )),
                            randomKey: false,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: appTheme.sizes.paddingSmall, bottom: appTheme.sizes.padding),
                      child: DottedLine(dashColor: appTheme.colors.borderColor,),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('质押奖励'.tr, style: Get.textTheme.bodyText1),
                        Obx(() => LAnimationView(child: Text(NumberTool.formatNumberStr(NumberTool.amountToBalance(state.rewardedAmount, scale: state.tokenInfo.scale))), randomKey: false,)),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            top: appTheme.sizes.padding,
            bottom: appTheme.sizes.padding,
          ),
          child: Text('已质押列表'.tr, style: TextStyle(color: appTheme.colors.textBlackBig, fontSize: appTheme.sizes.fontSizeBig, fontWeight: FontWeight.bold)),
        ),
        Expanded(
          child: LScrollView(
            refreshController: controller.delegateRefreshController,
            onRefresh: controller.initGetData,
            child: Obx(() => Column(
              children: [
                for (UserVerifierModel _item in state.myDelegatedVerifiesList)
                  Padding(
                    padding: EdgeInsets.only(bottom: appTheme.sizes.padding),
                    child: LVerifierCard(
                      verifier: _item,
                      child: Column(
                        children: [
                          Padding(padding: EdgeInsets.only(top: appTheme.sizes.paddingSmall)),
                          Row(
                            children: [
                              // Expanded(
                              //   child: Column(
                              //     crossAxisAlignment: CrossAxisAlignment.start,
                              //     children: [
                              //       LAnimationView(
                              //         randomKey: false,
                              //         child: Text('${_item.yieldRate}%', style: TextStyle(color: appTheme.colors.primaryColor, fontWeight: FontWeight.bold, letterSpacing: -1 * appTheme.sizes.basic,)),
                              //       ),
                              //       Padding(padding: EdgeInsets.only(top: appTheme.sizes.paddingSmall * 0.5)),
                              //       Text('预计年化收益率'.tr, style: Get.textTheme.bodyText1)
                              //     ],
                              //   ),
                              // ),
                              // Padding(padding: EdgeInsets.only(left: appTheme.sizes.paddingSmall * 0.5)),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: LAnimationView(
                                        randomKey: false,
                                        child: Text(
                                          NumberTool.formatNumberStr(NumberTool.amountToBalance(_item.pledged??'')),
                                          style: TextStyle(letterSpacing: -1 * appTheme.sizes.basic,)
                                        ),
                                      ),
                                    ),
                                    Padding(padding: EdgeInsets.only(top: appTheme.sizes.paddingSmall * 0.5)),
                                    Text('我的质押'.tr, style: Get.textTheme.bodyText1)
                                  ],
                                ),
                              ),
                              Padding(padding: EdgeInsets.only(left: appTheme.sizes.paddingSmall * 0.5)),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: LAnimationView(
                                        randomKey: false,
                                        child: Text(
                                          NumberTool.formatNumberStr(NumberTool.amountToBalance(_item.reward??'')),
                                          style: TextStyle(color: appTheme.colors.primaryColor, letterSpacing: -1 * appTheme.sizes.basic,)
                                        ),
                                      ),
                                    ),
                                    Padding(padding: EdgeInsets.only(top: appTheme.sizes.paddingSmall * 0.5)),
                                    Text('当前收益'.tr, style: Get.textTheme.bodyText1)
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: appTheme.sizes.paddingSmall),
                            child: InkWell(
                              onTap: () => controller.onGoToDelegatedDetails(_item),
                              child: Container(
                                width: appTheme.sizes.infinity,
                                height: appTheme.sizes.buttonHeight * 0.6,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(appTheme.sizes.radius)),
                                  gradient: LinearGradient(
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                    colors: appTheme.colors.homeAddressBg,
                                  ),
                                ),
                                child: Center(
                                  child: Text('查看详情'.tr, style: Get.textTheme.bodyText1),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
              ],
            )),
          ),
        ),
      ],
    );
  }
}