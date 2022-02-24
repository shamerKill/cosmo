import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_qr_reader/flutter_qr_reader.dart';
import 'package:plug/app/ui/components/layout/appbar.component.dart';
import 'package:plug/app/ui/components/layout/scaffold.component.dart';
import 'package:plug/app/ui/pages/wallet/qrScanner/qrScanner.controller.dart';
import 'package:plug/app/ui/theme/theme.dart';

class WalletQrScannerPage extends GetView<WalletQrScannerPageController> {
  const WalletQrScannerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WalletQrScannerPageState state = controller.state;

    return LScaffold(
      statusBar: LAppBar.defaultStatus(),
      headerBar: LAppBar.defaultHeader(),
      titleBar: LAppBar.defaultTitle(
        title: LAppBar.defaultHeaderTextWidget('扫描二维码'.tr),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: appTheme.sizes.paddingBig),
        child: Column(
          children: [
            Container(
              height: Get.width * 1.4,
              width: Get.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(appTheme.sizes.radius + appTheme.sizes.basic * 5.0)),
                border: Border.all(color: appTheme.colors.primaryColor, width: appTheme.sizes.basic * 5.0),
                color: appTheme.colors.primaryColor.withOpacity(0.1),
              ),
              child: Stack(
                children: [
                  Container(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(appTheme.sizes.radius)),
                    ),
                    child: Obx(() => state.isGetPermission ? QrReaderView(
                      width: Get.width,
                      height: Get.width * 1.4,
                      callback: (container) {
                        controller.scanController = container;
                        controller.startScan();
                      },
                    ) : Container()),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: appTheme.sizes.padding * 2.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.image),
                    color: appTheme.colors.primaryColor,
                    iconSize: appTheme.sizes.iconSize,
                    onPressed: controller.scanImage
                  ),
                  Obx(() => IconButton(
                    icon: Icon(state.isOpenedFlashLight ? Icons.flashlight_off : Icons.flashlight_on),
                    color: state.isOpenedFlashLight ? appTheme.colors.textGrayBig : appTheme.colors.primaryColor,
                    iconSize: appTheme.sizes.iconSize,
                    onPressed: controller.flashlight
                  )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}