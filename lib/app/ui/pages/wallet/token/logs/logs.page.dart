import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plug/app/data/models/interface/interface.dart';
import 'package:plug/app/ui/components/function/button.component.dart';
import 'package:plug/app/ui/components/layout/appbar.component.dart';
import 'package:plug/app/ui/components/layout/scaffold.component.dart';
import 'package:plug/app/ui/components/layout/scroll.component.dart';
import 'package:plug/app/ui/components/view/animation.component.dart';
import 'package:plug/app/ui/components/view/image.component.dart';
import 'package:plug/app/ui/components/view/logsItem.component.dart';
import 'package:plug/app/ui/pages/wallet/token/logs/logs.controller.dart';
import 'package:plug/app/ui/theme/theme.dart';
import 'package:plug/app/ui/utils/number.dart';
import 'package:plug/app/ui/utils/string.dart';

class WalletTokenLogsPage extends GetView<WalletTokenLogsPageController> {
  const WalletTokenLogsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WalletTokenLogsPageState state = controller.state;

    return LScaffold(
      statusBar: LAppBar.defaultStatus(),
      headerBar: LAppBar.defaultHeader(),
      titleBar: LAppBar.defaultTitle(
        padding: EdgeInsets.only(top: appTheme.sizes.paddingSmall),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                  bottom: appTheme.sizes.padding,
                  left: appTheme.sizes.padding,
                  right: appTheme.sizes.padding),
              child: Column(
                children: [
                  Row(
                    children: [
                      Obx(() => LViewImage(
                            url: state.tokenInfo.logo,
                            bgColor: StringTool.stringToColor(
                                state.tokenInfo.type == enumTokenType.prc20
                                    ? state.tokenInfo.contractAddress
                                    : state.tokenInfo.minUnit),
                            width: appTheme.sizes.basic * 60,
                            height: appTheme.sizes.basic * 60,
                            isRadius: true,
                          )),
                      Padding(
                          padding: EdgeInsets.only(
                              left: appTheme.sizes.paddingSmall)),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Obx(() => Text(state.tokenInfo.symbol,
                                style: TextStyle(
                                    fontSize: appTheme.sizes.fontSizeBig))),
                            Padding(
                                padding: EdgeInsets.only(
                                    bottom: appTheme.sizes.fontSizeSmall / 2)),
                            Obx(() => Text(state.tokenInfo.name,
                                style: Get.textTheme.bodyText1)),
                          ],
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Obx(() => Text(
                              NumberTool.formatNumberStr(
                                  NumberTool.amountToBalance(
                                      state.tokenInfo.amount,
                                      scale: state.tokenInfo.scale)),
                              style: TextStyle(
                                  fontSize: appTheme.sizes.fontSizeBig))),
                          Padding(
                              padding: EdgeInsets.only(
                                  bottom: appTheme.sizes.fontSizeSmall / 2)),
                          // TODO: 币种价格
                          // Obx(() => Text('≈\r\$' + NumberTool.formatNumberStr(NumberTool.amountToBalance(state.tokenInfo.amount, scale: state.tokenInfo.scale)), style: Get.textTheme.bodyText1)),
                        ],
                      ),
                    ],
                  ),
                  Padding(
                      padding: EdgeInsets.only(bottom: appTheme.sizes.padding)),
                  Row(
                    children: [
                      Expanded(
                        child: LButton(
                          child: Text('send'.tr,
                              style:
                                  TextStyle(color: appTheme.colors.textBlack)),
                          onPressed: controller.onToSend,
                          radius: true,
                          contrast: true,
                          height: appTheme.sizes.basic * 70,
                        ),
                      ),
                      Padding(
                          padding:
                              EdgeInsets.only(left: appTheme.sizes.padding)),
                      Expanded(
                        child: LButton(
                          child: Text('receive'.tr,
                              style:
                                  TextStyle(color: appTheme.colors.textBlack)),
                          onPressed: controller.onToReceive,
                          radius: true,
                          contrast: true,
                          height: appTheme.sizes.basic * 70,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              height: appTheme.sizes.padding,
              color: appTheme.colors.borderColor,
            ),
          ],
        ),
      ),
      padding: EdgeInsets.all(appTheme.sizes.zero),
      body: Obx(() => LScrollView(
            refreshController: controller.allRefreshController,
            onRefresh: controller.onRefresh,
            onLoading:
                state.logsPageAll == 0 ? null : () => controller.onLoading(),
            child: Column(
              children: state.transferLogsAll
                  .map((_item) => InkWell(
                        onTap: () => controller.onGoToDetail(_item),
                        child: LAnimationView(
                          child: LLogsItemView(
                            item: _item,
                            key: Key(_item.hash +
                                'log_items' +
                                _item.rawLog.toString()),
                          ),
                          randomKey: false,
                          vKey: Key(_item.toJson()),
                        ),
                      ))
                  .toList(),
            ),
          )),
    );
  }
}
