import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flustars/flustars.dart';
import 'package:plug/app/ui/components/function/toast.component.dart';
import 'package:plug/app/ui/theme/theme.dart';

class LScaffold extends GetView<LScaffoldController> {
  const LScaffold({
    Key? key,
    this.statusBar,
    this.headerBar,
    this.titleBar,
    this.body,
    this.footer,
    this.drawer,
    this.onDrawerChanged,
    this.bottomNavigationBar,
    this.padding,
    this.scaffoldKey,
    this.hidBottomBar = false,
    this.singleScroll = false,
    this.basicBackgroundColor = false,
  }) : super(key: key);
  final AppBar? statusBar;
  final Widget? headerBar;
  final Widget? titleBar;
  final Widget? body;
  final Widget? footer;
  final Widget? drawer;
  final void Function(bool)? onDrawerChanged;
  final Widget? bottomNavigationBar;
  final EdgeInsetsGeometry? padding;
  /// 是否隐藏底部安全距离
  final bool hidBottomBar;
  final bool singleScroll;
  // 是否显示首页的背景色
  final bool basicBackgroundColor;
  final Key? scaffoldKey;

  @override
  Widget build(BuildContext context) {
    final LScaffoldController controller = Get.put(LScaffoldController());
    return GestureDetector(
      // 点击其他位置取消焦点
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: WillPopScope(
        child: Scaffold(
          key: scaffoldKey,
          appBar: statusBar,
          onDrawerChanged: onDrawerChanged,
          drawer: drawer,
          backgroundColor: basicBackgroundColor ? appTheme.colors.pageBackgroundColorBasic : null,
          body: SizedBox(
            height: appTheme.sizes.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (headerBar != null) headerBar!,
                if (titleBar != null) titleBar!,
                if (body != null) Expanded(
                  flex: 1,
                  child: Container(
                    width: appTheme.sizes.infinity,
                    padding: padding??EdgeInsets.only(
                      left: appTheme.sizes.padding, right: appTheme.sizes.padding,
                      bottom: (hidBottomBar || footer != null || bottomNavigationBar != null) ? 0 :
                        (ScreenUtil.getBottomBarH(context) == 0.0 ? appTheme.sizes.padding : ScreenUtil.getBottomBarH(context)),
                    ),
                    child: singleScroll ? SingleChildScrollView(child: body) : body,
                  ),
                ),
                if (footer != null) Container(
                  width: appTheme.sizes.infinity,
                  padding: padding??EdgeInsets.only(
                    left: appTheme.sizes.padding, right: appTheme.sizes.padding,
                      bottom: hidBottomBar ? 0 :
                        (ScreenUtil.getBottomBarH(context) == 0 ? appTheme.sizes.padding : ScreenUtil.getBottomBarH(context))
                  ),
                  child: footer,
                ),
              ],
            ),
          ),
          bottomNavigationBar: bottomNavigationBar,
        ),
        onWillPop: GetPlatform.isAndroid ? controller.onWillPop : null,
      ),
    );
  }
}


class LScaffoldController extends GetxController {
  DateTime? _lastPressBackTime;
  Future<bool> onWillPop () async {
    if (!GetPlatform.isAndroid) return true;
    bool isFirstRoute = Get.key.currentState?.canPop()??true;
    if (isFirstRoute) return true;
    if (
      _lastPressBackTime == null ||
      DateTime.now().difference(_lastPressBackTime!) > const Duration(seconds: 1)
    ) {
      LToast.info('exitAppToast'.tr);
      _lastPressBackTime = DateTime.now();
      return false;
    }
    return true;
  }
}