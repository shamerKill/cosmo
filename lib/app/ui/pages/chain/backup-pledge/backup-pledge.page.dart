import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plug/app/ui/components/function/button.component.dart';
import 'package:plug/app/ui/components/function/input.component.dart';
import 'package:plug/app/ui/components/layout/appbar.component.dart';
import 'package:plug/app/ui/components/layout/scaffold.component.dart';
import 'package:plug/app/ui/components/view/image.component.dart';
import 'package:plug/app/ui/components/view/verifierCard.component.dart';
import 'package:plug/app/ui/pages/chain/backup-pledge/backup-pledge.controller.dart';
import 'package:plug/app/ui/theme/theme.dart';
import 'package:plug/app/ui/utils/number.dart';

class ChainBackupPledgePage extends GetView<ChainBackupPledgePageController> {
  const ChainBackupPledgePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ChainBackupPledgePageState state = controller.state;

    return LScaffold(
      statusBar: LAppBar.defaultStatus(),
      headerBar: LAppBar.defaultHeader(),
      hidHorizontalPadding: true,
      singleScroll: true,
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: appTheme.sizes.padding),
            child: Stack(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.all(appTheme.sizes.basic * 5.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: appTheme.colors.borderColor),
                        borderRadius: BorderRadius.all(Radius.circular(appTheme.sizes.basic * 100.0)),
                      ),
                      child: Obx(() => LViewImage(
                        url: state.veriferInfo.avatar,
                        width: appTheme.sizes.basic * 56.0,
                        height: appTheme.sizes.basic * 56.0,
                        isRadius: true,
                      )),
                    ),
                    Padding(padding: EdgeInsets.only(left: appTheme.sizes.basic * 10.0)),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Obx(() =>  Text(state.veriferInfo.nickName, style: TextStyle(fontSize: appTheme.sizes.fontSizeBig, fontWeight: FontWeight.bold, height: 1.6))),
                        Padding(padding: EdgeInsets.only(bottom: appTheme.sizes.basic * 10.0)),
                        Obx(() => Text(state.veriferInfo.address, style: Get.textTheme.bodyText1)),
                      ],
                    ),
                  ],
                ),
                Positioned(
                  top: appTheme.sizes.basic * 10.0,
                  right: appTheme.sizes.zero,
                  child: LVerifierStatusNode(verifier: state.veriferInfo),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: appTheme.sizes.padding, right: appTheme.sizes.padding, top: appTheme.sizes.padding),
            child: Container(
              width: appTheme.sizes.infinity,
              padding: EdgeInsets.only(top: appTheme.sizes.padding, bottom: appTheme.sizes.paddingSmall),
              decoration: BoxDecoration(
                border: Border(top: BorderSide(color: appTheme.colors.borderColor.withOpacity(0.5))),
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('年化收益率'.tr, style: TextStyle(color: appTheme.colors.textGray)),
                        Padding(padding: EdgeInsets.only(top: appTheme.sizes.basic * 10.0)),
                        Text(state.veriferInfo.yieldRate + '%', style: TextStyle(color: appTheme.colors.primaryColor, fontWeight: FontWeight.bold))
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('质押中数量'.tr, style: TextStyle(color: appTheme.colors.textGray)),
                        Padding(padding: EdgeInsets.only(top: appTheme.sizes.basic * 10.0)),
                        Text(NumberTool.formatNumberStr(NumberTool.amountToBalance(state.veriferInfo.pledged.toString())))
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text('最小质押量'.tr, style: TextStyle(color: appTheme.colors.textGray)),
                        Padding(padding: EdgeInsets.only(top: appTheme.sizes.basic * 10.0)),
                        Text(NumberTool.formatNumberStr(NumberTool.amountToBalance(state.veriferInfo.minPledgVolume.toString())))
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: appTheme.sizes.basic * 30.0,
            color: appTheme.colors.pageBackgroundColorBasic,
          ),
          Container(
            padding: EdgeInsets.all(appTheme.sizes.padding),
            width: appTheme.sizes.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('赎回数量'.tr, style: const TextStyle(fontWeight: FontWeight.bold)),
                Padding(padding: EdgeInsets.only(top: appTheme.sizes.padding)),
                LInput(
                  textController: controller.pledgeController,
                  hintText: '请输入将要质押的数量'.tr,
                  obscureText: true,
                  suffix: Text(state.baseCoin.symbol, style: TextStyle(color: appTheme.colors.textBlack)),
                  onlyNumber: true,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: appTheme.sizes.padding),
                  child: Obx(() => Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(text: '账户余额'.tr),
                        const TextSpan(text: '  '),
                        TextSpan(
                          text: NumberTool.formatNumberStr(NumberTool.amountToBalance(state.baseCoin.amount, scale: state.baseCoin.scale)),
                          style: TextStyle(color: appTheme.colors.primaryColor)
                        ),
                        const TextSpan(text: ' '),
                        TextSpan(text: state.baseCoin.symbol, style: TextStyle(color: appTheme.colors.primaryColor))
                      ]
                    ),
                    style: Get.textTheme.bodyText1
                  ))
                ),
                DottedLine(dashColor: appTheme.colors.borderColor),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: appTheme.sizes.padding),
                  child: Obx(() => Text(
                    '手续费'.tr + ' ' + NumberTool.formatNumberStr(NumberTool.amountToBalance(state.feeAmount, scale: state.baseCoin.scale)) + ' ' + state.baseCoin.symbol,
                    style: TextStyle(fontSize: appTheme.sizes.fontSizeSmall),
                  )),
                ),
                Text('赎回委托需要等待 21 天。'.tr, style: Get.textTheme.bodyText1?.copyWith(color: appTheme.colors.warningColor)),
                Padding(
                  padding: EdgeInsets.only(top: appTheme.sizes.padding * 2, bottom: appTheme.sizes.padding),
                  child: Obx(() => LButton(
                    onPressed: controller.onPledgeListener,
                    width: appTheme.sizes.infinity,
                    disabled: state.pledgeLoading,
                    child: Text('赎回'.tr),
                  )),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}