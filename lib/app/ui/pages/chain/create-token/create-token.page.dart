import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plug/app/ui/components/function/button.component.dart';
import 'package:plug/app/ui/components/function/input.component.dart';
import 'package:plug/app/ui/components/layout/appbar.component.dart';
import 'package:plug/app/ui/components/layout/scaffold.component.dart';
import 'package:plug/app/ui/pages/chain/create-token/create-token.controller.dart';
import 'package:plug/app/ui/theme/theme.dart';

class ChainCreateTokenPage extends GetView<ChainCreateTokenPageController> {
  const ChainCreateTokenPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ChainCreateTokenPageState state = controller.state;

    return LScaffold(
      statusBar: LAppBar.defaultStatus(),
      headerBar: LAppBar.defaultHeader(),
      titleBar: LAppBar.defaultTitle(
        title: LAppBar.defaultHeaderTextWidget('createToken'.tr),
      ),
      singleScroll: true,
      basicBackgroundColor: true,
      body: Column(
        children: [
          Padding(padding: EdgeInsets.only(top: appTheme.sizes.padding)),
          Padding(
            padding: EdgeInsets.only(top: appTheme.sizes.padding),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Text('tokenName'.tr, textAlign: TextAlign.center),
                ),
                Expanded(
                  flex: 4,
                  child: LInput(
                    textController: controller.coinNameTextController,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: appTheme.sizes.padding),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Text('tokenSymbol'.tr, textAlign: TextAlign.center),
                ),
                Expanded(
                  flex: 4,
                  child: LInput(
                    textController: controller.coinSymbolTextController,
                    focusNode: controller.coinSymbolFocusNode,
                    hintText: 'tokenSymbolInputHint'.tr,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: appTheme.sizes.padding),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child:
                      Text('tokenTotalSupply'.tr, textAlign: TextAlign.center),
                ),
                Expanded(
                  flex: 4,
                  child: LInput(
                    textController: controller.coinTotalVolumeTextController,
                    onlyNumber: true,
                    onlyInt: true,
                    labelText: 'tokenTotalInputHint'.tr,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: appTheme.sizes.padding),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Text('tokenScale'.tr, textAlign: TextAlign.center),
                ),
                Expanded(
                  flex: 4,
                  child: InkWell(
                    onTap: controller.onExchangeScale,
                    child: LInput(
                      textController: controller.coinScaleVolumeTextController,
                      disabled: true,
                      labelText: 'tokenScaleInputHint'.tr,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: appTheme.sizes.padding),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Text('tokenAdditionalType'.tr,
                      textAlign: TextAlign.center),
                ),
                Expanded(
                  flex: 4,
                  child: InkWell(
                    onTap: controller.onExchangeMintable,
                    child: LInput(
                      textController:
                          controller.coinMintableVolumeTextController,
                      disabled: true,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: appTheme.sizes.padding),
            child: DottedLine(
              dashColor: appTheme.colors.borderColor,
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: Padding(
              padding:
                  EdgeInsets.only(bottom: appTheme.sizes.paddingSmall * 0.2),
              child: Text(
                'createTokenDesc1'.tr,
                style: TextStyle(
                    color: appTheme.colors.textGray,
                    fontSize: appTheme.sizes.fontSizeSmall),
                textAlign: TextAlign.left,
              ),
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: Padding(
              padding: EdgeInsets.only(bottom: appTheme.sizes.paddingSmall),
              child: Text(
                'createTokenDesc2'.tr,
                style: TextStyle(
                    color: appTheme.colors.textGray,
                    fontSize: appTheme.sizes.fontSizeSmall),
                textAlign: TextAlign.left,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: appTheme.sizes.paddingSmall),
            child: Obx(() => Text(
                  '${'fee'.tr}\r\r ${state.fee} ${controller.dataCoins.state.baseCoin.symbol}',
                  style: TextStyle(color: appTheme.colors.primaryColor),
                )),
          ),
          Padding(
            padding: EdgeInsets.only(top: appTheme.sizes.paddingSmall * 0.2),
            child: Obx(() => state.isExist
                ? Text(
                    'ErrorWithCoinSymbolRepeat'.tr,
                    style: TextStyle(color: appTheme.colors.errorColor),
                  )
                : Text(
                    '${'tokenSendFee'.tr}\r\r ${state.createFee} ${controller.dataCoins.state.baseCoin.symbol}',
                    style: TextStyle(color: appTheme.colors.primaryColor),
                  )),
          ),
          Padding(
            padding: EdgeInsets.only(top: appTheme.sizes.paddingBig),
            child: LButton(
              child: Text('tokenCreateStart'.tr),
              width: appTheme.sizes.infinity,
              onPressed: controller.createToken,
            ),
          ),
        ],
      ),
    );
  }
}
