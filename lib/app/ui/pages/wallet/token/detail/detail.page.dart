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
      statusBar: LAppBar.defaultStatus(backgroundColor: appTheme.colors.pageBackgroundColor),
      headerBar: LAppBar.defaultHeader(backgroundColor: appTheme.colors.pageBackgroundColor),
      titleBar: LAppBar.defaultTitle(
        backgroundColor: appTheme.colors.pageBackgroundColor,
        description: Row(
          children: [
            Obx(() => LViewImage(
              url: state.tokenInfo.logo,
              bgColor: StringTool.stringToColor(state.tokenInfo.minUnit),
              width: appTheme.sizes.basic * 80,
              height: appTheme.sizes.basic * 80,
              isRadius: true,
            )),
            Padding(padding: EdgeInsets.only(left: appTheme.sizes.paddingSmall)),
            Obx(() => Text(state.tokenInfo.symbol, style: TextStyle(fontSize: appTheme.sizes.fontSizeBig)))
          ],
        ),
      ),
      basicBackgroundColor: true,
      padding: EdgeInsets.only(bottom: (ScreenUtil.getBottomBarH(context) == 0 ? appTheme.sizes.padding : ScreenUtil.getBottomBarH(context))),
      body: Column(
        children: [
          Padding(padding: EdgeInsets.only(top: appTheme.sizes.padding)),
          Container(
            decoration: BoxDecoration(
              color: appTheme.colors.pageBackgroundColor,
            ),
            padding: EdgeInsets.only(
              left: appTheme.sizes.padding, right: appTheme.sizes.padding, bottom: appTheme.sizes.padding
            ),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: appTheme.sizes.padding),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('全称', style: Get.textTheme.bodyText1),
                      Obx(() => LAnimationView(child: Text(state.tokenInfo.name))),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: appTheme.sizes.padding),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('发行总量', style: Get.textTheme.bodyText1),
                      Obx(() => LAnimationView(child: Text(NumberTool.formatNumberStr(NumberTool.amountToBalance(state.tokenInfo.maxSupply))))),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: appTheme.sizes.padding),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('精度', style: Get.textTheme.bodyText1),
                      Obx(() => LAnimationView(child: Text(state.tokenInfo.scale.toString()))),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: appTheme.sizes.padding),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('增发状态', style: Get.textTheme.bodyText1),
                      Obx(() => LAnimationView(child: Text(state.tokenInfo.mintable ? '可增发' : '不可增发'))),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: appTheme.sizes.padding),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('拥有数量', style: Get.textTheme.bodyText1),
                      Obx(() => LAnimationView(child: Text(NumberTool.formatNumberStr(NumberTool.amountToBalance(state.tokenInfo.amount))))),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: appTheme.sizes.padding),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('代币类型', style: Get.textTheme.bodyText1),
                      Obx(() => LAnimationView(child: Text(StringTool.tokenTypeToString(state.tokenInfo.type)))),
                    ],
                  ),
                ),
                Obx(() => state.tokenInfo.type == enumTokenType.prc20 ? (
                  Padding(
                    padding: EdgeInsets.only(top: appTheme.sizes.padding),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('合约地址', style: Get.textTheme.bodyText1),
                        Obx(() => LAnimationView(child: SelectableText(
                          state.tokenInfo.contractAddress, style: TextStyle(fontSize: appTheme.sizes.fontSizeSmall),
                        ))),
                      ],
                    ),
                  )
                ) : Container())
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: appTheme.sizes.padding, left: appTheme.sizes.padding, right: appTheme.sizes.padding,
            ),
            child: Obx(() => state.showButton ? LAnimationView(
              randomKey: false,
              child: LButton(
                onPressed: controller.onTokenToggle,
                width: appTheme.sizes.infinity,
                contrast: state.isAdd,
                child: Text(state.isAdd ? '移除' : '添加'),
              ),
            ) : Container()),
          ),
        ],
      ),
    );
  }
}