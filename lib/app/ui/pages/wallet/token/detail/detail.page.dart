import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plug/app/data/models/interface/interface.dart';
import 'package:plug/app/ui/components/function/button.component.dart';
import 'package:plug/app/ui/components/layout/appbar.component.dart';
import 'package:plug/app/ui/components/layout/scaffold.component.dart';
import 'package:plug/app/ui/components/view/animation.component.dart';
import 'package:plug/app/ui/components/view/image.component.dart';
import 'package:plug/app/ui/pages/wallet/token/detail/detail.controller.dart';
import 'package:plug/app/ui/theme/theme.dart';
import 'package:plug/app/ui/utils/number.dart';
import 'package:plug/app/ui/utils/string.dart';

class WalletTokenDetailPage extends GetView<WalletTokenDetailPageController> {
  const WalletTokenDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WalletTokenDetailPageState state = controller.state;

    return LScaffold(
      statusBar: LAppBar.defaultStatus(
          backgroundColor: appTheme.colors.pageBackgroundColor),
      headerBar: LAppBar.defaultHeader(
          backgroundColor: appTheme.colors.pageBackgroundColor),
      titleBar: LAppBar.defaultTitle(
        backgroundColor: appTheme.colors.pageBackgroundColor,
        description: Row(
          children: [
            Obx(() => LViewImage(
                  url: state.tokenInfo.logo,
                  bgColor: StringTool.stringToColor(
                      state.tokenInfo.type == EnumTokenType.prc20
                          ? state.tokenInfo.contractAddress
                          : state.tokenInfo.minUnit),
                  width: appTheme.sizes.basic * 80,
                  height: appTheme.sizes.basic * 80,
                  isRadius: true,
                )),
            Padding(
                padding: EdgeInsets.only(left: appTheme.sizes.paddingSmall)),
            Obx(() => Text(state.tokenInfo.symbol,
                style: TextStyle(fontSize: appTheme.sizes.fontSizeBig)))
          ],
        ),
      ),
      basicBackgroundColor: true,
      padding: EdgeInsets.only(
          bottom: (ScreenUtil.getBottomBarH(context) == 0
              ? appTheme.sizes.padding
              : ScreenUtil.getBottomBarH(context))),
      body: Column(
        children: [
          Padding(padding: EdgeInsets.only(top: appTheme.sizes.padding)),
          Container(
            decoration: BoxDecoration(
              color: appTheme.colors.pageBackgroundColor,
            ),
            padding: EdgeInsets.only(
                left: appTheme.sizes.padding,
                right: appTheme.sizes.padding,
                bottom: appTheme.sizes.padding),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: appTheme.sizes.padding),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('tokenName'.tr, style: Get.textTheme.bodyText1),
                      Obx(() =>
                          LAnimationView(child: Text(state.tokenInfo.name))),
                    ],
                  ),
                ),
                Obx(() => state.tokenInfo.type == EnumTokenType.prc10
                    ? (Padding(
                        padding: EdgeInsets.only(top: appTheme.sizes.padding),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('tokenTotalSupply'.tr,
                                style: Get.textTheme.bodyText1),
                            Obx(() => LAnimationView(
                                child: Text(NumberTool.formatNumberStr(
                                    NumberTool.amountToBalance(
                                        state.tokenInfo.maxSupply))))),
                          ],
                        ),
                      ))
                    : Container()),
                Padding(
                  padding: EdgeInsets.only(top: appTheme.sizes.padding),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('tokenScale'.tr, style: Get.textTheme.bodyText1),
                      Obx(() => LAnimationView(
                          child: Text(state.tokenInfo.scale.toString()))),
                    ],
                  ),
                ),
                Obx(() => state.tokenInfo.type == EnumTokenType.prc10
                    ? (Padding(
                        padding: EdgeInsets.only(top: appTheme.sizes.padding),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('tokenMintType'.tr,
                                style: Get.textTheme.bodyText1),
                            Obx(() => LAnimationView(
                                child: Text(state.tokenInfo.mintable
                                    ? 'mint'
                                    : 'notMint'))),
                          ],
                        ),
                      ))
                    : Container()),
                Padding(
                  padding: EdgeInsets.only(top: appTheme.sizes.padding),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('hadVolume'.tr, style: Get.textTheme.bodyText1),
                      Obx(() => LAnimationView(
                          child: Text(NumberTool.formatNumberStr(
                              NumberTool.amountToBalance(
                                  state.tokenInfo.amount))))),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: appTheme.sizes.padding),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('tokenType'.tr, style: Get.textTheme.bodyText1),
                      Obx(() => LAnimationView(
                          child: Text(StringTool.tokenTypeToString(
                              state.tokenInfo.type)))),
                    ],
                  ),
                ),
                Obx(() => state.tokenInfo.type == EnumTokenType.prc20
                    ? (Padding(
                        padding: EdgeInsets.only(top: appTheme.sizes.padding),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('contractAddress'.tr,
                                style: Get.textTheme.bodyText1),
                            Obx(() => LAnimationView(
                                    child: SelectableText(
                                  state.tokenInfo.contractAddress,
                                  style: TextStyle(
                                      fontSize: appTheme.sizes.fontSizeSmall),
                                ))),
                          ],
                        ),
                      ))
                    : Container())
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: appTheme.sizes.padding,
              left: appTheme.sizes.padding,
              right: appTheme.sizes.padding,
            ),
            child: Obx(() => state.showButton
                ? LAnimationView(
                    randomKey: false,
                    child: LButton(
                      onPressed: controller.onTokenToggle,
                      width: appTheme.sizes.infinity,
                      contrast: state.isAdd,
                      child: Text(state.isAdd ? 'delete' : 'add'),
                    ),
                  )
                : Container()),
          ),
        ],
      ),
    );
  }
}
