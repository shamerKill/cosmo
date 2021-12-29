import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plug/app/ui/theme/theme.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:plug/app/ui/components/layout/appbar.component.dart';
import 'package:plug/app/ui/components/layout/scaffold.component.dart';
import 'package:plug/app/ui/pages/dapp/webview/webview.controller.dart';

class DappWebviewPage extends GetView<DappWebviewPageController> {
  const DappWebviewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DappWebviewPageState state = controller.state;

    return LScaffold(
      statusBar: LAppBar.defaultStatus(),
      headerBar: Padding(
        padding: EdgeInsets.only(
          left: appTheme.sizes.padding,
          right: appTheme.sizes.padding,
          top: appTheme.sizes.paddingSmall / 2,
          bottom: appTheme.sizes.paddingSmall / 2,
        ),
        child: Row(
          children: [
            Expanded(
              child: Obx(() => Text(
                state.title,
                style: TextStyle(
                  color: appTheme.colors.textBlackBig,
                  fontSize: appTheme.sizes.fontSizeBig,
                  fontWeight: FontWeight.bold,
                ),
                softWrap: true,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              )),
            ),
            Padding(padding: EdgeInsets.only(left: appTheme.sizes.paddingSmall)),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(appTheme.sizes.basic * 60.0)),
                border: Border.all(color: appTheme.colors.borderColor),
              ),
              child: Row(
                children: [
                  InkWell(
                    onTap: controller.onShowMoreTool,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: appTheme.sizes.paddingSmall / 2,
                        horizontal: appTheme.sizes.paddingSmall,
                      ),
                      child: Icon(Icons.more_horiz_outlined, color: appTheme.colors.textGray),
                    ),
                  ),
                  Container(
                    width: appTheme.sizes.basic,
                    height: appTheme.sizes.basic * 32.0,
                    color: appTheme.colors.borderColor
                  ),
                  InkWell(
                    onTap: controller.onCloseWebview,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: appTheme.sizes.paddingSmall / 2,
                        horizontal: appTheme.sizes.paddingSmall,
                      ),
                      child: Icon(Icons.close_outlined, color: appTheme.colors.primaryColor)
                    ),
                  ),
                ],
              ),
            ),
          ]
        ),
      ),
      titleBar: Builder(builder: (_context) => Container(
        height: appTheme.sizes.basic * 5.0,
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: appTheme.colors.borderColor),
          ),
        ),
        child: Obx(() => LinearProgressIndicator(
          value: state.webProgress,
          backgroundColor: appTheme.colors.transparent,
          valueColor: AlwaysStoppedAnimation<Color>(
            state.webProgress == 1.0 ? appTheme.colors.transparent : appTheme.colors.primaryColor
          ),
        )),
      )),
      padding: EdgeInsets.all(appTheme.sizes.zero),
      body: WillPopScope(
        onWillPop: controller.onWillPop,
        child: WebView(
          initialUrl: state.link,
          javascriptMode: JavascriptMode.unrestricted,
          onWebResourceError: controller.onWebviewError,
          onPageStarted: controller.onWebviewStarted,
          onWebViewCreated: controller.onWebviewCreated,
          onPageFinished: controller.onWebviewFinished,
          onProgress: controller.onWebviewProgress,
          gestureNavigationEnabled: true,
          navigationDelegate: controller.onNavigationDelegate,
        ),
      ),
    );
  }
}