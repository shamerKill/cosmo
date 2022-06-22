import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plug/app/ui/components/layout/appbar.component.dart';
import 'package:plug/app/ui/components/layout/scaffold.component.dart';
import 'package:plug/app/ui/components/view/qrcode.component.dart';
import 'package:plug/app/ui/pages/wallet/token/receive/receive.controller.dart';
import 'package:plug/app/ui/theme/theme.dart';

class WalletTokenReceivePage extends GetView<WalletTokenReceivePageController> {
  const WalletTokenReceivePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WalletTokenReceivePageState state = controller.state;

    return LScaffold(
      statusBar: LAppBar.defaultStatus(),
      headerBar: LAppBar.defaultHeader(),
      titleBar: LAppBar.defaultTitle(
        title: LAppBar.defaultHeaderTextWidget('receive'.tr),
        description: Padding(
          padding: EdgeInsets.only(top: appTheme.sizes.padding),
          child: Container(
            width: appTheme.sizes.infinity,
            padding: EdgeInsets.symmetric(horizontal: appTheme.sizes.paddingSmall, vertical: appTheme.sizes.paddingSmall),
            decoration: BoxDecoration(
              color: appTheme.colors.primaryColor.withOpacity(0.2),
              borderRadius: BorderRadius.all(Radius.circular(appTheme.sizes.radius)),
            ),
            child: Center(
              child: Text(
                'receiveTip'.tr,
                style: TextStyle(color: appTheme.colors.primaryColor, fontSize: appTheme.sizes.fontSizeSmall),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ),
      singleScroll: true,
      basicBackgroundColor: true,
      body: Padding(
        padding: EdgeInsets.only(top: appTheme.sizes.padding),
        child: Container(
          decoration: BoxDecoration(
            color: appTheme.colors.pageBackgroundColor,
            borderRadius: BorderRadius.all(Radius.circular(appTheme.sizes.radius)),
          ),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: appTheme.sizes.padding * 2),
                child: Obx(() => Text('receiveScanTip'.tr + state.tokenInfo.symbol, style: Get.textTheme.bodyText1)),
              ),
              Obx(() => LQrCodeView(address: state.accountInfo.address, hideTitle: true)),
              Padding(padding: EdgeInsets.only(bottom: appTheme.sizes.padding)),
              DottedLine(
                dashColor: appTheme.colors.borderColor,
              ),
              Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: controller.onShare,
                      child: SizedBox(
                        height: appTheme.sizes.basic * 100,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(const IconData(0xe6df, fontFamily: 'plugIcon'), color: appTheme.colors.textGrayBig, size: appTheme.sizes.inputIconSize),
                            Padding(padding: EdgeInsets.only(left: appTheme.sizes.paddingSmall / 2)),
                            Text('share'.tr, style: TextStyle(letterSpacing: 2, color: appTheme.colors.textGrayBig)),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: controller.onCopy,
                      child: SizedBox(
                        height: appTheme.sizes.basic * 100,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(const IconData(0xe6fc, fontFamily: 'plugIcon'), color: appTheme.colors.primaryColor, size: appTheme.sizes.inputIconSize),
                            Padding(padding: EdgeInsets.only(left: appTheme.sizes.paddingSmall / 2)),
                            Text('copy'.tr, style: TextStyle(letterSpacing: 2, color: appTheme.colors.primaryColor)),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}