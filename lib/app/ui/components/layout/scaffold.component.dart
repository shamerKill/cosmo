import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flustars/flustars.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plug/app/ui/components/function/toast.component.dart';
import 'package:plug/app/ui/theme/theme.dart';

class LScaffold extends GetView<LScaffoldController> {
  const LScaffold({
    Key? key,
    this.statusBar,
    this.headerBar,
    this.titleBar,
    this.body,
    this.padding,
    this.hidBottomBar = false,
    this.singleScroll = false,
  }) : super(key: key);
  final AppBar? statusBar;
  final Widget? headerBar;
  final Widget? body;
  final Widget? titleBar;
  final EdgeInsetsGeometry? padding;
  /// 是否隐藏底部安全距离
  final bool hidBottomBar;
  final bool singleScroll;

  @override
  Widget build(BuildContext context) {
    final LScaffoldController controller = Get.put(LScaffoldController());
    return GestureDetector(
      // 点击其他位置取消焦点
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: WillPopScope(
        child: Scaffold(
          appBar: statusBar,
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
                      bottom: hidBottomBar ? 0 :
                        (Get.bottomBarHeight == 0 ? appTheme.sizes.padding : Get.bottomBarHeight.sp)
                    ),
                    child: singleScroll ? SingleChildScrollView(child: body) : body,
                  ),
                ),
              ],
            ),
          ),
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