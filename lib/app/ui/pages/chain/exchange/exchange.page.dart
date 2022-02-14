import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plug/app/ui/components/function/button.component.dart';
import 'package:plug/app/ui/components/function/input.component.dart';
import 'package:plug/app/ui/components/layout/appbar.component.dart';
import 'package:plug/app/ui/components/layout/scaffold.component.dart';
import 'package:plug/app/ui/components/view/animation.component.dart';
import 'package:plug/app/ui/components/view/image.component.dart';
import 'package:plug/app/ui/pages/chain/exchange/exchange.controller.dart';
import 'package:plug/app/ui/theme/theme.dart';

class ChainExchangePage extends GetView<ChainExchangePageController> {
  const ChainExchangePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ChainExchangePageState state = controller.state;

    return LScaffold(
      statusBar: LAppBar.defaultStatus(),
      headerBar: LAppBar.defaultHeader(),
      titleBar: LAppBar.defaultTitle(
        title: LAppBar.defaultHeaderTextWidget('兑换'.tr),
      ),
      basicBackgroundColor: true,
      body: Column(
        children: [
          Padding(padding: EdgeInsets.only(bottom: appTheme.sizes.padding)),
          InkWell(
            onTap: controller.changeExchangeTokenList,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: appTheme.sizes.padding, vertical: appTheme.sizes.padding),
              decoration: BoxDecoration(
                color: appTheme.colors.pageBackgroundColor,
                borderRadius: BorderRadius.all(Radius.circular(appTheme.sizes.radius)),
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Obx(() => LAnimationView(
                          child: LViewImage(
                            width: appTheme.sizes.basic * 56.0,
                            height: appTheme.sizes.basic * 56.0,
                            url: state.startToken.logo,
                            isRadius: true,
                          ),
                        )),
                        Padding(padding: EdgeInsets.only(right: appTheme.sizes.paddingSmall)),
                        Obx(() => LAnimationView(
                          randomKey: false,
                          child: Text(
                            state.startToken.symbol,
                            style: TextStyle(
                              fontSize: appTheme.sizes.fontSize, fontWeight: FontWeight.bold,
                            ),
                          ),
                        ))
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Opacity(
                      opacity: 0.5,
                      child: Image(
                        image: const AssetImage('assets/images/page_exchange_to.png'),
                        width: appTheme.sizes.basic * 40.0,
                        height: appTheme.sizes.basic * 56.0,
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(right: appTheme.sizes.basic * 20.0)),
                  Expanded(
                    flex: 3,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Obx(() => LAnimationView(
                          child: LViewImage(
                            width: appTheme.sizes.basic * 56.0,
                            height: appTheme.sizes.basic * 56.0,
                            url: state.endToken.logo,
                            isRadius: true,
                          ),
                        )),
                        Padding(padding: EdgeInsets.only(right: appTheme.sizes.paddingSmall)),
                        Obx(() => LAnimationView(
                          randomKey: false,
                          child: Text(
                            state.endToken.symbol,
                            style: TextStyle(
                              fontSize: appTheme.sizes.fontSize, fontWeight: FontWeight.bold,
                            ),
                          ),
                        ))
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(padding: EdgeInsets.only(top: appTheme.sizes.padding)),
          Container(
            width: appTheme.sizes.infinity,
            padding: EdgeInsets.symmetric(horizontal: appTheme.sizes.padding, vertical: appTheme.sizes.padding),
            decoration: BoxDecoration(
              color: appTheme.colors.pageBackgroundColor,
              borderRadius: BorderRadius.all(Radius.circular(appTheme.sizes.radius)),
            ),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 1,
                      child: LInput(
                        hintText: '转出数量'.tr,
                        fillColor: appTheme.colors.pageBackgroundColor,
                        hidBorder: true,
                        onlyNumber: true,
                        keyboardType: TextInputType.number,
                        textController: controller.sendInputController,
                        onChanged: controller.onListenInputVolume,
                        autofocus: true,
                      ),
                    ),
                    Text('——', style: TextStyle(fontWeight: FontWeight.bold, color: appTheme.colors.textGray)),
                    Padding(padding: EdgeInsets.only(left: appTheme.sizes.padding)),
                    Expanded(
                      flex: 1,
                      child: LInput(
                        hintText: '收到数量'.tr,
                        fillColor: appTheme.colors.pageBackgroundColor,
                        hidBorder: true,
                        onlyNumber: true,
                        keyboardType: TextInputType.number,
                        disabled: true,
                        textController: controller.receiptInputController,
                      ),
                    )
                  ],
                ),
                DottedLine(
                  dashColor: appTheme.colors.borderColor,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: appTheme.sizes.padding),
                  child: Row(
                    children: [
                      Image(
                        image: const AssetImage('assets/images/page_exchange_wallet.png'),
                        width: appTheme.sizes.basic * 32.0,
                        height: appTheme.sizes.basic * 32.0,
                      ),
                      Padding(padding: EdgeInsets.only(right: appTheme.sizes.paddingSmall)),
                      Obx(() => LAnimationView(
                        randomKey: false,
                        child: Text('${state.sendCoinBalance} ${state.startToken.symbol}'),
                      )),
                      Expanded(
                        flex: 1,
                        child: Container(),
                      ),
                      LButton(
                        onPressed: controller.onMaxExchange,
                        child: Text('最大'.tr),
                        radius: true,
                        height: appTheme.sizes.basic * 45.0,
                      )
                    ],
                  ),
                ),
                DottedLine(
                  dashColor: appTheme.colors.borderColor,
                ),
              ],
            ),
          ),
        ],
      ),
      footer: LButton(
        child: Text('确认兑换'.tr),
        onPressed: controller.onExchangeButton
      ),
    );
  }
}