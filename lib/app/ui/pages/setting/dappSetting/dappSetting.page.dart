import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plug/app/ui/components/layout/appbar.component.dart';
import 'package:plug/app/ui/components/layout/scaffold.component.dart';
import 'package:plug/app/ui/pages/setting/dappSetting/dappSetting.controller.dart';
import 'package:plug/app/ui/theme/theme.dart';
import 'package:flutter_webview_pro/webview_flutter.dart';

class UserDappSettingPage extends GetView<UserDappSettingPageController> {
  const UserDappSettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserDappSettingPageState state = controller.state;

    return LScaffold(
      statusBar: LAppBar.defaultStatus(),
      headerBar: LAppBar.defaultHeader(),
      titleBar: LAppBar.defaultTitle(
        title: LAppBar.defaultHeaderTextWidget('dappSetting'.tr),
      ),
      basicBackgroundColor: true,
      padding: EdgeInsets.only(
          bottom: (ScreenUtil.getBottomBarH(context) == 0
              ? appTheme.sizes.padding
              : ScreenUtil.getBottomBarH(context))),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: appTheme.sizes.zero,
            height: appTheme.sizes.zero,
            child: WebView(
              onWebViewCreated: (WebViewController webviewController) async {
                state.webviewController = webviewController;
              },
            ),
          ),
          Padding(
              padding: EdgeInsets.symmetric(vertical: appTheme.sizes.padding)),
          Container(
            decoration: BoxDecoration(
              color: appTheme.colors.pageBackgroundColor,
            ),
            padding: EdgeInsets.only(
              top: appTheme.sizes.paddingSmall * 0.6,
              bottom: appTheme.sizes.paddingSmall * 0.6,
              left: appTheme.sizes.padding,
              right: appTheme.sizes.paddingSmall,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('dappSafeSetting'.tr),
                Obx(() => Switch(
                      value: state.safeMode,
                      onChanged: controller.onToggleSafeMode,
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    )),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: appTheme.sizes.padding,
                vertical: appTheme.sizes.paddingSmall),
            child:
                Text('dappSafeSettingDesc'.tr, style: Get.textTheme.bodyText1),
          ),
          InkWell(
            onTap: controller.onClearNetCache,
            child: Container(
              width: appTheme.sizes.infinity,
              decoration: BoxDecoration(
                color: appTheme.colors.pageBackgroundColor,
              ),
              padding: EdgeInsets.only(
                top: appTheme.sizes.padding,
                bottom: appTheme.sizes.padding,
                left: appTheme.sizes.padding,
                right: appTheme.sizes.paddingSmall,
              ),
              child: Text('clearNetCache'.tr,
                  style: TextStyle(color: appTheme.colors.errorColor)),
            ),
          ),
          Padding(padding: EdgeInsets.only(top: appTheme.sizes.padding)),
          Obx(() => Column(
                children: [
                  if (!state.safeMode)
                    InkWell(
                      onTap: controller.onClearDappPermission,
                      child: Container(
                        width: appTheme.sizes.infinity,
                        decoration: BoxDecoration(
                          color: appTheme.colors.pageBackgroundColor,
                        ),
                        padding: EdgeInsets.only(
                          top: appTheme.sizes.padding,
                          bottom: appTheme.sizes.padding,
                          left: appTheme.sizes.padding,
                          right: appTheme.sizes.paddingSmall,
                        ),
                        child: Text('clearDappPermission'.tr,
                            style:
                                TextStyle(color: appTheme.colors.errorColor)),
                      ),
                    ),
                  if (!state.safeMode)
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: appTheme.sizes.padding,
                          vertical: appTheme.sizes.paddingSmall),
                      child: Text('clearDappPermissionDesc'.tr,
                          style: Get.textTheme.bodyText1),
                    ),
                ],
              ))
        ],
      ),
    );
  }
}
