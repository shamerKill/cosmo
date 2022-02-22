import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plug/app/ui/components/function/button.component.dart';
import 'package:plug/app/ui/components/function/input.component.dart';
import 'package:plug/app/ui/components/layout/appbar.component.dart';
import 'package:plug/app/ui/components/layout/scaffold.component.dart';
import 'package:plug/app/ui/components/view/image.component.dart';
import 'package:plug/app/ui/components/view/verifierCard.component.dart';
import 'package:plug/app/ui/pages/chain/pledge-transfer/pledge-transfer.controller.dart';
import 'package:plug/app/ui/theme/theme.dart';
import 'package:plug/app/ui/utils/number.dart';
import 'package:plug/app/ui/utils/string.dart';

class ChainPledgeTransferPage extends GetView<ChainPledgeTransferPageController> {
  const ChainPledgeTransferPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ChainPledgeTransferPageState state = controller.state;

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
                        url: state.verifierInfo.avatar,
                        bgColor: StringTool.stringToColor(state.verifierInfo.address),
                        width: appTheme.sizes.basic * 56.0,
                        height: appTheme.sizes.basic * 56.0,
                        isRadius: true,
                      )),
                    ),
                    Padding(padding: EdgeInsets.only(left: appTheme.sizes.basic * 10.0)),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Obx(() =>  Text(state.verifierInfo.nickName, style: TextStyle(fontSize: appTheme.sizes.fontSizeBig, fontWeight: FontWeight.bold, height: 1.6))),
                        Padding(padding: EdgeInsets.only(bottom: appTheme.sizes.basic * 10.0)),
                        Obx(() => Text(state.verifierInfo.address, style: Get.textTheme.bodyText1)),
                      ],
                    ),
                  ],
                ),
                Positioned(
                  top: appTheme.sizes.basic * 10.0,
                  right: appTheme.sizes.zero,
                  child: LVerifierStatusNode(verifier: state.verifierInfo),
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
                  // Expanded(
                  //   flex: 1,
                  //   child: Column(
                  //     crossAxisAlignment: CrossAxisAlignment.start,
                  //     children: [
                  //       Text('预计年化收益率'.tr, style: TextStyle(color: appTheme.colors.textGray)),
                  //       Padding(padding: EdgeInsets.only(top: appTheme.sizes.basic * 10.0)),
                  //       Text(state.veriferInfo.yieldRate + '%', style: TextStyle(color: appTheme.colors.primaryColor, fontWeight: FontWeight.bold))
                  //     ],
                  //   ),
                  // ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('节点质押总量'.tr, style: TextStyle(color: appTheme.colors.textGray)),
                        Padding(padding: EdgeInsets.only(top: appTheme.sizes.basic * 10.0)),
                        Obx(() => Text(NumberTool.formatNumberStr(NumberTool.amountToBalance(state.verifierInfo.allPledged.toString()))))
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
                        Obx(() => Text(NumberTool.formatNumberStr(NumberTool.amountToBalance(state.verifierInfo.minPledgeVolume.toString()))))
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
                Text('质押数量'.tr, style: const TextStyle(fontWeight: FontWeight.bold)),
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
                        TextSpan(text: '可质押数量'.tr),
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
                    '手续费'.tr + ' ' + NumberTool.formatNumberStr(state.feeAmount) + ' ' + state.baseCoin.symbol,
                    style: TextStyle(fontSize: appTheme.sizes.fontSizeSmall),
                  )),
                ),
                Container(
                  padding: EdgeInsets.all(appTheme.sizes.padding),
                  decoration: BoxDecoration(
                    color: appTheme.colors.pageBackgroundColorBasic,
                    borderRadius: BorderRadius.all(Radius.circular(appTheme.sizes.radius)),
                  ),
                  child: Column(
                    children: [
                      Obx(() => Text('委托 ${state.baseCoin.symbol} 给验证节点可以随时赎回，但赎回委托需要等待 21 天。'.tr, style: Get.textTheme.bodyText1)),
                      Padding(padding: EdgeInsets.only(top: appTheme.sizes.paddingSmall)),
                      Text('如果验证节点行为不端将可能会被罚没部分委托代币，比如验证节点双重签名、经常性离线。为了规避风险，请认真选择合格的验证节点。'.tr, style: Get.textTheme.bodyText1),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: appTheme.sizes.padding * 2, bottom: appTheme.sizes.padding),
                  child: Obx(() => LButton(
                    onPressed: controller.onPledgeListener,
                    width: appTheme.sizes.infinity,
                    disabled: state.pledgeLoading,
                    child: Text('质押'.tr),
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