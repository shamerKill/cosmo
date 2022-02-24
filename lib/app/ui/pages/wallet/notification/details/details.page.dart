import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plug/app/ui/utils/string.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:plug/app/ui/components/layout/appbar.component.dart';
import 'package:plug/app/ui/components/layout/scaffold.component.dart';
import 'package:plug/app/ui/pages/wallet/notification/details/details.controller.dart';

class WalletNotificationDetailsPage extends GetView<WalletNotificationDetailsPageController> {
  const WalletNotificationDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WalletNotificationDetailsPageState state = controller.state;

    return LScaffold(
      statusBar: LAppBar.defaultStatus(),
      headerBar: LAppBar.defaultHeader(),
      titleBar: LAppBar.defaultTitle(
        title: Obx(() => LAppBar.defaultHeaderTextWidget(state.notificationInfo.title)),
        description: Obx(() => Text(state.notificationInfo.time??'', style: Get.textTheme.bodyText1)),
      ),
      body: Obx(() => state.notificationContext == '' ? Container() : WebView(
        initialUrl: state.notificationContext,
      )),
    );
  }
}