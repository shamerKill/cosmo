import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plug/app/ui/components/function/button.component.dart';
import 'package:plug/app/ui/components/layout/appbar.component.dart';
import 'package:plug/app/ui/components/layout/scaffold.component.dart';
import 'package:plug/app/ui/components/view/image.component.dart';
import 'package:plug/app/ui/components/view/verifierCard.component.dart';
import 'package:plug/app/ui/pages/chain/verifier-detail-info/verifier-detail-info.controller.dart';
import 'package:plug/app/ui/theme/theme.dart';
import 'package:plug/app/ui/utils/number.dart';

class ChainVerifierDetailInfoPage extends GetView<ChainVerifierDetailInfoPageController> {
  const ChainVerifierDetailInfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ChainVerifierDetailInfoPageState state = controller.state;

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
                borderRadius: BorderRadius.all(Radius.circular(appTheme.sizes.basic * 50)),
              ),
              child: LViewImage(
                width: appTheme.sizes.basic * 50.0,
                height: appTheme.sizes.basic * 50.0,
                url: state.verifierInfo.avatar,
                isRadius: true,
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: appTheme.sizes.paddingSmall, right: appTheme.sizes.paddingSmall),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Text(
                    state.verifierInfo.nickName,
                    style: TextStyle(color: appTheme.colors.textBlackBig, fontWeight: FontWeight.bold)
                  ),
                ),
              ),
            ),
            LVerifierStatusNode(verifier: state.verifierInfo,),
          ],
        ),
      ),
      basicBackgroundColor: true,
      singleScroll: true,
      body: Column(
        children: [
          Padding(padding: EdgeInsets.only(top: appTheme.sizes.padding)),
          Container(
            width: appTheme.sizes.infinity,
            padding: EdgeInsets.symmetric(
              horizontal: appTheme.sizes.padding,
              vertical: appTheme.sizes.padding,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(appTheme.sizes.radius)),
              color: appTheme.colors.pageBackgroundColor,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(padding: EdgeInsets.only(top: appTheme.sizes.paddingSmall)),
                    Text('验证者'.tr, style: TextStyle(color: appTheme.colors.textGrayBig)),
                    Padding(padding: EdgeInsets.only(bottom: appTheme.sizes.paddingSmall * 0.5)),
                    Obx(() => Text(state.verifierInfo.address, style: TextStyle(color: appTheme.colors.primaryColor))),
                    Padding(padding: EdgeInsets.only(bottom: appTheme.sizes.paddingSmall)),
                    DottedLine(dashColor: appTheme.colors.borderColor,),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(padding: EdgeInsets.only(top: appTheme.sizes.paddingSmall)),
                    Text('预计年化收益率'.tr, style: TextStyle(color: appTheme.colors.textGrayBig)),
                    Padding(padding: EdgeInsets.only(bottom: appTheme.sizes.paddingSmall * 0.5)),
                    Obx(() => Text('${state.verifierInfo.yieldRate}%')),
                    Padding(padding: EdgeInsets.only(bottom: appTheme.sizes.paddingSmall)),
                    DottedLine(dashColor: appTheme.colors.borderColor,),
                  ],
                ),
                Obx(() => Visibility(
                  visible: state.verifierInfo.reward != null,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(padding: EdgeInsets.only(top: appTheme.sizes.paddingSmall)),
                      Text('收益'.tr, style: TextStyle(color: appTheme.colors.textGrayBig)),
                      Padding(padding: EdgeInsets.only(bottom: appTheme.sizes.paddingSmall * 0.5)),
                      Text(NumberTool.formatNumberStr(NumberTool.amountToBalance(state.verifierInfo.reward??'')) + ' ' + state.baseCoinInfo.symbol),
                      Padding(padding: EdgeInsets.only(bottom: appTheme.sizes.paddingSmall)),
                      DottedLine(dashColor: appTheme.colors.borderColor,),
                    ],
                  ),
                )),
                Obx(() => Visibility(
                  visible: state.verifierInfo.pledged != null,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(padding: EdgeInsets.only(top: appTheme.sizes.paddingSmall)),
                      Text('我的质押'.tr, style: TextStyle(color: appTheme.colors.textGrayBig)),
                      Padding(padding: EdgeInsets.only(bottom: appTheme.sizes.paddingSmall * 0.5)),
                      Text(NumberTool.formatNumberStr(NumberTool.amountToBalance(state.verifierInfo.pledged??'')) + ' ' + state.baseCoinInfo.symbol, style: TextStyle(color: appTheme.colors.primaryColor)),
                      Padding(padding: EdgeInsets.only(bottom: appTheme.sizes.paddingSmall)),
                      DottedLine(dashColor: appTheme.colors.borderColor,),
                    ],
                  ),
                )),
                Obx(() => Visibility(
                  visible: state.verifierInfo.rePledging != null,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(padding: EdgeInsets.only(top: appTheme.sizes.paddingSmall)),
                      Text('转质押数量'.tr, style: TextStyle(color: appTheme.colors.textGrayBig)),
                      Padding(padding: EdgeInsets.only(bottom: appTheme.sizes.paddingSmall * 0.5)),
                      Text(NumberTool.formatNumberStr(NumberTool.amountToBalance(state.verifierInfo.rePledging??'')) + ' ' + state.baseCoinInfo.symbol, style: TextStyle(color: appTheme.colors.primaryColor)),
                      Padding(padding: EdgeInsets.only(bottom: appTheme.sizes.paddingSmall)),
                      DottedLine(dashColor: appTheme.colors.borderColor,),
                    ],
                  ),
                )),
                Obx(() => Visibility(
                  visible: state.verifierInfo.redeeming != null,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(padding: EdgeInsets.only(top: appTheme.sizes.paddingSmall)),
                      Text('赎回中数量'.tr, style: TextStyle(color: appTheme.colors.textGrayBig)),
                      Padding(padding: EdgeInsets.only(bottom: appTheme.sizes.paddingSmall * 0.5)),
                      Text(NumberTool.formatNumberStr(NumberTool.amountToBalance(state.verifierInfo.redeeming??'')) + ' ' + state.baseCoinInfo.symbol, style: TextStyle(color: appTheme.colors.primaryColor)),
                      Padding(padding: EdgeInsets.only(bottom: appTheme.sizes.paddingSmall)),
                      DottedLine(dashColor: appTheme.colors.borderColor,),
                    ],
                  ),
                )),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(padding: EdgeInsets.only(top: appTheme.sizes.paddingSmall)),
                    Text('节点质押总量'.tr, style: TextStyle(color: appTheme.colors.textGrayBig)),
                    Padding(padding: EdgeInsets.only(bottom: appTheme.sizes.paddingSmall * 0.5)),
                    Obx(() => Text(NumberTool.formatNumberStr(NumberTool.amountToBalance(state.verifierInfo.allPledged??'')) + ' ' + state.baseCoinInfo.symbol)),
                    Padding(padding: EdgeInsets.only(bottom: appTheme.sizes.paddingSmall)),
                    DottedLine(dashColor: appTheme.colors.borderColor,),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(padding: EdgeInsets.only(top: appTheme.sizes.paddingSmall)),
                    Text('节点最小质押量'.tr, style: TextStyle(color: appTheme.colors.textGrayBig)),
                    Padding(padding: EdgeInsets.only(bottom: appTheme.sizes.paddingSmall * 0.5)),
                    Obx(() => Text(NumberTool.formatNumberStr(NumberTool.amountToBalance(state.verifierInfo.minPledgVolume??'')) + ' ' + state.baseCoinInfo.symbol)),
                    Padding(padding: EdgeInsets.only(bottom: appTheme.sizes.paddingSmall)),
                    DottedLine(dashColor: appTheme.colors.borderColor,),
                  ],
                ),
              ],
            ),
          ),
        ]
      ),
    );
  }
}