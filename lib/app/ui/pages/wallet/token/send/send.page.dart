import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plug/app/ui/components/function/button.component.dart';
import 'package:plug/app/ui/components/function/input.component.dart';
import 'package:plug/app/ui/components/layout/appbar.component.dart';
import 'package:plug/app/ui/components/layout/scaffold.component.dart';
import 'package:plug/app/ui/pages/wallet/token/send/send.controller.dart';
import 'package:plug/app/ui/theme/theme.dart';
import 'package:plug/app/ui/utils/number.dart';

class WalletTokenSendPage extends GetView<WalletTokenSendPageController> {
  const WalletTokenSendPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WalletTokenSendPageState state = controller.state;

    return LScaffold(
      statusBar: LAppBar.defaultStatus(),
      headerBar: LAppBar.defaultHeader(),
      titleBar: LAppBar.defaultTitle(
        title: LAppBar.defaultHeaderTextWidget('send'.tr),
        description: Padding(
            padding: EdgeInsets.only(bottom: appTheme.sizes.paddingSmall)),
      ),
      singleScroll: true,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('receiveAddress'.tr,
                  style: TextStyle(color: appTheme.colors.textBlackBig)),
              InkWell(
                onTap: controller.onGoToAddressList,
                child: Padding(
                  padding: EdgeInsets.all(appTheme.sizes.paddingSmall),
                  child: Text('addressesBook'.tr,
                      style: TextStyle(color: appTheme.colors.primaryColor)),
                ),
              ),
            ],
          ),
          Obx(() => LInput(
                hintText: 'addAccountAddress'.tr,
                textController: controller.addressController,
                disabled: state.sendLoading,
                suffixIcon: IconButton(
                  icon: const Icon(IconData(0xe6de, fontFamily: 'plugIcon')),
                  onPressed: controller.onScanQr,
                  splashRadius: appTheme.sizes.iconSize,
                ),
              )),
          Padding(padding: EdgeInsets.only(top: appTheme.sizes.padding)),
          Text('transferVolume'.tr,
              style: TextStyle(color: appTheme.colors.textBlackBig)),
          Padding(padding: EdgeInsets.only(top: appTheme.sizes.paddingSmall)),
          Obx(() => LInput(
                hintText: 'transferVolume'.tr,
                textController: controller.volumeController,
                onlyNumber: true,
                disabled: state.sendLoading,
                suffixIcon: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: appTheme.sizes.paddingSmall),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Obx(() => Text(state.tokenInfo.symbol,
                          style: TextStyle(color: appTheme.colors.textGray)))
                    ],
                  ),
                ),
              )),
          Padding(padding: EdgeInsets.only(top: appTheme.sizes.paddingSmall)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Obx(() => Text.rich(
                      TextSpan(children: [
                        TextSpan(text: 'canUseTransferVolume'.tr),
                        const TextSpan(text: '\r\r'),
                        TextSpan(
                          text: NumberTool.formatNumberStr(
                                  NumberTool.amountToBalance(
                                      state.tokenInfo.amount,
                                      scale: state.tokenInfo.scale)) +
                              '\r' +
                              state.tokenInfo.symbol,
                          style: TextStyle(color: appTheme.colors.primaryColor),
                        ),
                      ]),
                    )),
              ),
              InkWell(
                onTap: state.sendLoading ? null : controller.onAllSend,
                child: Padding(
                  padding: EdgeInsets.all(appTheme.sizes.paddingSmall),
                  child: Text('allSend'.tr,
                      style: TextStyle(color: appTheme.colors.primaryColor)),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(
                top: appTheme.sizes.paddingSmall,
                bottom: appTheme.sizes.paddingSmall),
            child: DottedLine(
              dashColor: appTheme.colors.borderColor,
            ),
          ),
          Obx(() => Text('fee'.tr +
              '\r\r${NumberTool.formatNumberStr(state.fee)}\r${controller.dataCoins.state.baseCoin.symbol}')),
        ],
      ),
      footer: Obx(() => LButton(
            onPressed: state.sendLoading ? null : controller.onSend,
            child: Text('send'.tr),
          )),
    );
  }
}
