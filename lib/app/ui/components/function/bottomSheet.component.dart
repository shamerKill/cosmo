import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:plug/app/ui/components/function/button.component.dart';
import 'package:plug/app/ui/components/function/input.component.dart';
import 'package:plug/app/ui/theme/theme.dart';

class LBottomSheet {
  static Future<T?> baseBottomSheet<T>({
    Widget? child, bool horizontalPadding = false,
    bool showClose = true,
  }) {
    return Get.bottomSheet<T>(
      Container(
        decoration: BoxDecoration(
          color: appTheme.colors.pageBackgroundColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(appTheme.sizes.radius * 2),
            topRight: Radius.circular(appTheme.sizes.radius * 2),
          ),
        ),
        clipBehavior: Clip.hardEdge,
        child: SingleChildScrollView(
          padding: horizontalPadding ? EdgeInsets.symmetric(horizontal: appTheme.sizes.padding) : null,
          child: Column(
            children: [
              // 顶部关闭
              if (showClose) Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: Get.back,
                    icon: Icon(Icons.close, size: appTheme.sizes.iconSize),
                    padding: EdgeInsets.symmetric(vertical: appTheme.sizes.paddingSmall, horizontal: appTheme.sizes.paddingSmall),
                  ),
                ],
              ),
              if (child != null) child,
              // 底部尺寸
              Padding(padding: EdgeInsets.only(bottom: Get.bottomBarHeight == 0 ? appTheme.sizes.padding : Get.bottomBarHeight.sp)),
            ],
          ),
        ),
      ),
      enableDrag: true,
      isDismissible: true,
      barrierColor: appTheme.colors.pageConTrastColor.withOpacity(0.5),
    );
  }
  static Future<String?> passwordBottomSheet() {
    TextEditingController passwordController = TextEditingController();
    bool _visiblePassword = false;
    return baseBottomSheet<String>(
      showClose: false,
      child: Builder(
        builder: (BuildContext _) {
          return StatefulBuilder(builder: (_, setBottomSheetState) {
            return Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: appTheme.sizes.titleBarHeight,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Text(
                        'walletPassword'.tr,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: appTheme.sizes.fontSizeBig, fontWeight: FontWeight.bold)
                      ),
                      Positioned(
                        top: 0,
                        right: 0,
                        child: IconButton(
                          icon: Icon(Icons.close, color: appTheme.colors.textBlack, size: appTheme.sizes.iconSize),
                          onPressed: Get.back,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: appTheme.sizes.padding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(padding: EdgeInsets.only(bottom: appTheme.sizes.paddingSmall)),
                      LInput(
                        textController: passwordController,
                        labelText: 'inputPassword'.tr,
                        visibilityPass: _visiblePassword,
                        passOnPress: () { setBottomSheetState(() {_visiblePassword =!_visiblePassword;}); },
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text('passwordForget'.tr, style: Get.textTheme.bodyText1?.copyWith(fontSize: appTheme.sizes.fontSize)),
                      ),
                      LButton(
                        width: appTheme.sizes.infinity,
                        height: appTheme.sizes.buttonHeight * 0.9,
                        child: Text('确认'.tr),
                        onPressed: () => Get.back(result: passwordController.text),
                      ),
                    ],
                  ),
                ),
              ],
            );
          });
        },
      ),
    );
  }
}