import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:plug/app/ui/theme/theme.dart';

class LBottomSheet {
  static Future baseBottomSheet ({
    Widget? child, bool horizontalPadding = false,
    bool showClose = true,
  }) {
    return Get.bottomSheet(
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
}