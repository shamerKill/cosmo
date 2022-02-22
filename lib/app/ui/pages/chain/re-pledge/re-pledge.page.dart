import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plug/app/ui/components/function/button.component.dart';
import 'package:plug/app/ui/components/function/input.component.dart';
import 'package:plug/app/ui/components/layout/appbar.component.dart';
import 'package:plug/app/ui/components/layout/scaffold.component.dart';
import 'package:plug/app/ui/components/layout/scroll.component.dart';
import 'package:plug/app/ui/components/view/animation.component.dart';
import 'package:plug/app/ui/components/view/image.component.dart';
import 'package:plug/app/ui/components/view/verifierCard.component.dart';
import 'package:plug/app/ui/pages/chain/re-pledge/re-pledge.controller.dart';
import 'package:plug/app/ui/theme/theme.dart';
import 'package:plug/app/ui/utils/number.dart';
import 'package:plug/app/ui/utils/string.dart';

class ChainRePledgePage extends GetView<ChainRePledgePageController> {
  const ChainRePledgePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ChainRePledgePageState state = controller.state;

    return LScaffold(
      statusBar: LAppBar.defaultStatus(),
      headerBar: LAppBar.defaultHeader(),
      hidHorizontalPadding: true,
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
                  //       Text('年化收益率'.tr, style: TextStyle(color: appTheme.colors.textGray)),
                  //       Padding(padding: EdgeInsets.only(top: appTheme.sizes.basic * 10.0)),
                  //       Text(state.verifierInfo.yieldRate + '%', style: TextStyle(color: appTheme.colors.primaryColor, fontWeight: FontWeight.bold))
                  //     ],
                  //   ),
                  // ),
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('质押中数量'.tr, style: TextStyle(color: appTheme.colors.textGray)),
                        Padding(padding: EdgeInsets.only(top: appTheme.sizes.basic * 10.0)),
                        Obx(() => Text(NumberTool.formatNumberStr(NumberTool.amountToBalance(state.verifierInfo.pledged.toString()))))
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text('质押奖励'.tr, style: TextStyle(color: appTheme.colors.textGray)),
                        Padding(padding: EdgeInsets.only(top: appTheme.sizes.basic * 10.0)),
                        Obx(() => Text(NumberTool.formatNumberStr(NumberTool.amountToBalance(state.verifierInfo.reward.toString()))))
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
                Text('转让数量'.tr, style: const TextStyle(fontWeight: FontWeight.bold)),
                Padding(padding: EdgeInsets.only(top: appTheme.sizes.padding)),
                LInput(
                  textController: controller.pledgeController,
                  hintText: '请输入将要质押的数量'.tr,
                  obscureText: true,
                  suffix: Obx(() => Text(state.baseCoin.symbol, style: TextStyle(color: appTheme.colors.textBlack))),
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
                    '手续费'.tr + ' ' + NumberTool.formatNumberStr(state.feeAmount) + ' ' + state.baseCoin.symbol,
                    style: TextStyle(fontSize: appTheme.sizes.fontSizeSmall),
                  )),
                )
              ],
            ),
          ),
          Container(
            width: appTheme.sizes.infinity,
            padding: EdgeInsets.symmetric(horizontal: appTheme.sizes.padding, vertical: appTheme.sizes.paddingSmall),
            color: appTheme.colors.pageBackgroundColorBasic,
            child: Text('选择质押节点'.tr, style: const TextStyle(fontWeight: FontWeight.bold)),
          ),
          Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                color: appTheme.colors.pageBackgroundColorBasic,
              ),
              child: Obx(() => LScrollView(
                refreshController: controller.verifiersRefreshController,
                onRefresh: controller.onRefreshVerifiersList,
                onLoading: state.allVerifiersPage == 0 ? null : controller.onLoadVerifiersList,
                child: Column(
                  children: [
                    for (var _item in state.allVerifiers)
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: appTheme.sizes.padding, vertical: appTheme.sizes.paddingSmall),
                        child: InkWell(
                          onTap: () => controller.onSelectVerifier(_item),
                          child: Container(
                            decoration: BoxDecoration(
                              color: state.selectVerifier.address == _item.address ? appTheme.colors.primaryColor.withOpacity(0.05) : appTheme.colors.pageBackgroundColor,
                              borderRadius: BorderRadius.all(Radius.circular(appTheme.sizes.radius)),
                              border: Border.all(
                                width: appTheme.sizes.basic,
                                color: state.selectVerifier.address == _item.address ? appTheme.colors.primaryColor : appTheme.colors.transparent,
                              ),
                            ),
                            child: LVerifierCard(
                              transparentBg: true,
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
                                            LAnimationView(
                                              randomKey: false,
                                              child: Text(NumberTool.formatNumberStr(NumberTool.amountToBalance(_item.minPledgeVolume)), style: TextStyle(color: appTheme.colors.primaryColor, fontWeight: FontWeight.bold, letterSpacing: -1 * appTheme.sizes.basic,)),
                                            ),
                                            Padding(padding: EdgeInsets.only(top: appTheme.sizes.paddingSmall * 0.5)),
                                            Text('最小质押'.tr, style: Get.textTheme.bodyText1)
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
                                                  NumberTool.formatNumberStr(NumberTool.amountToBalance(_item.allPledged)),
                                                  style: TextStyle(letterSpacing: -1 * appTheme.sizes.basic,)
                                                ),
                                              ),
                                            ),
                                            Padding(padding: EdgeInsets.only(top: appTheme.sizes.paddingSmall * 0.5)),
                                            Text('总质押'.tr, style: Get.textTheme.bodyText1)
                                          ],
                                        ),
                                      ),
                                      // Padding(padding: EdgeInsets.only(left: appTheme.sizes.paddingSmall * 0.5)),
                                      // Expanded(
                                      //   child: Column(
                                      //     crossAxisAlignment: CrossAxisAlignment.end,
                                      //     children: [
                                      //       SingleChildScrollView(
                                      //         scrollDirection: Axis.horizontal,
                                      //         child: LAnimationView(
                                      //           randomKey: false,
                                      //           child: Text(
                                      //             _item.pledged == '' ? '未质押' : NumberTool.formatNumberStr(NumberTool.amountToBalance(_item.pledged)),
                                      //             style: _item.pledged == '' ? TextStyle(color: appTheme.colors.textGrayBig) : TextStyle(color: appTheme.colors.primaryColor, letterSpacing: -1 * appTheme.sizes.basic,)
                                      //           ),
                                      //         ),
                                      //       ),
                                      //       Padding(padding: EdgeInsets.only(top: appTheme.sizes.paddingSmall * 0.5)),
                                      //       Text('我的质押'.tr, style: Get.textTheme.bodyText1),
                                      //     ],
                                      //   ),
                                      // ),
                                    ],
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: appTheme.sizes.paddingSmall),
                                    child: InkWell(
                                      onTap: () => controller.onVerifierDetailListener(_item),
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
                          ),
                        ),
                      ),
                  ],
                ),
              )),
            ),
          )
        ],
      ),
      footerBgColor: appTheme.colors.pageBackgroundColorBasic,
      footer: Container(
        padding: EdgeInsets.only(bottom: appTheme.sizes.padding, right: appTheme.sizes.padding, left: appTheme.sizes.padding),
        child: Obx(() => LButton(
          onPressed: controller.onPledgeListener,
          width: appTheme.sizes.infinity,
          disabled: state.pledgeLoading,
          child: Text('转让质押'.tr),
        )),
      ),
    );
  }
}