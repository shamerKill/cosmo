import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
              padding: EdgeInsets.only(bottom: appTheme.sizes.padding, left: appTheme.sizes.padding, right: appTheme.sizes.padding),
              child: Column(
                children: [
                  Row(
                    children: [
                      Obx(() => LViewImage(
                        url: state.tokenInfo.logo,
                        bgColor: StringTool.stringToColor(state.tokenInfo.symbol),
                        width: appTheme.sizes.basic * 60,
                        height: appTheme.sizes.basic * 60,
                        isRadius: true,
                      )),
                      Padding(padding: EdgeInsets.only(left: appTheme.sizes.paddingSmall)),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Obx(() => Text(state.tokenInfo.symbol, style: TextStyle(fontSize: appTheme.sizes.fontSizeBig))),
                            Padding(padding: EdgeInsets.only(bottom: appTheme.sizes.fontSizeSmall / 2)),
                            Obx(() => Text(state.tokenInfo.name, style: Get.textTheme.bodyText1)),
                          ],
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Obx(() => Text(NumberTool.formatNumberStr(NumberTool.amountToBalance(state.tokenInfo.amount, scale: state.tokenInfo.scale)), style: TextStyle(fontSize: appTheme.sizes.fontSizeBig))),
                          Padding(padding: EdgeInsets.only(bottom: appTheme.sizes.fontSizeSmall / 2)),
                          // TODO: 币种价格
                          // Obx(() => Text('≈\r\$' + NumberTool.formatNumberStr(NumberTool.amountToBalance(state.tokenInfo.amount, scale: state.tokenInfo.scale)), style: Get.textTheme.bodyText1)),
                        ],
                      ),
                    ],
                  ),
                  Padding(padding: EdgeInsets.only(bottom: appTheme.sizes.padding)),
                  Row(
                    children: [
                      Expanded(
                        child: LButton(
                          child: Text('转账'.tr, style: TextStyle(color: appTheme.colors.textBlack)),
                          onPressed: controller.onToSend,
                          radius: true,
                          contrast: true,
                          height: appTheme.sizes.basic * 70,
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(left: appTheme.sizes.padding)),
                      Expanded(
                        child: LButton(
                          child: Text('收款'.tr, style: TextStyle(color: appTheme.colors.textBlack)),
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
            TabBar(
              controller: controller.tabController,
              labelColor: appTheme.colors.primaryColor,
              unselectedLabelColor: appTheme.colors.textGray,
              indicatorColor: appTheme.colors.primaryColor,
              indicatorSize: TabBarIndicatorSize.label,
              isScrollable: true,
              tabs: [
                // Padding(
                //   padding: EdgeInsets.all(appTheme.sizes.paddingSmall),
                //   child: Text('全部'.tr),
                // ),
                Padding(
                  padding: EdgeInsets.all(appTheme.sizes.paddingSmall),
                  child: Text('转出'.tr),
                ),
                Padding(
                  padding: EdgeInsets.all(appTheme.sizes.paddingSmall),
                  child: Text('转入'.tr),
                ),
              ],
            ),
            Container(
              width: appTheme.sizes.infinity,
              height: appTheme.sizes.basic,
              color: appTheme.colors.borderColor.withOpacity(0.8),
            ),
          ],
        ),
      ),
      padding: EdgeInsets.all(appTheme.sizes.zero),
      body: TabBarView(
        controller: controller.tabController,
        children: [
          // 全部
          // LScrollView(
          //   refreshController: controller.allRefreshController,
          //   onRefresh: () => controller.onRefresh(WalletTokenLogsPageTabType.all),
          //   onLoading: state.logsPageAll == 0 ? null : () => controller.onLoading(WalletTokenLogsPageTabType.all),
          //   child: Obx(() => Column(
          //     children: state.transferLogsAll.map((_item) => InkWell(
          //       onTap: () => controller.onGoToDetail(_item.hash),
          //       child: LAnimationView(
          //         child: LLogsItemView(item: _item), randomKey: false, vKey: Key(_item.toJson()),
          //       ),
          //     )).toList(),
          //   )),
          // ),
          // 转出
          Obx(() => LScrollView(
            refreshController: controller.sendRefreshController,
            onRefresh: () => controller.onRefresh(WalletTokenLogsPageTabType.send),
            onLoading: state.logsPageSend == 0 ? null : () => controller.onLoading(WalletTokenLogsPageTabType.send),
            child: Column(
              children: [
                for (var _item in state.transferLogsSend)
                  InkWell(
                    onTap: () => controller.onGoToDetail(_item.hash),
                    child: LAnimationView(
                      child: LLogsItemView(item: _item), randomKey: false, vKey: Key(_item.toJson()),
                    ),
                  ),
              ],
            ),
          )),
          // 转入
          Obx(() => LScrollView(
            refreshController: controller.receiveRefreshController,
            onRefresh: () => controller.onRefresh(WalletTokenLogsPageTabType.receive),
            onLoading: state.logsPageReceive == 0 ? null : () => controller.onLoading(WalletTokenLogsPageTabType.receive),
            child: Column(
              children: [
                for (var _item in state.transferLogsReceive)
                  InkWell(
                    onTap: () => controller.onGoToDetail(_item.hash),
                    child: LAnimationView(
                      child: LLogsItemView(item: _item), randomKey: false, vKey: Key(_item.toJson()),
                    ),
                  ),
              ],
            ),
          )),
        ],
      ),
    );
  }
}