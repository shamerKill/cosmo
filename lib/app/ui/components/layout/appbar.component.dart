import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:plug/app/ui/theme/theme.dart';

class LAppBar {
  static AppBar defaultStatus ({
    Color? backgroundColor,
  }) => AppBar(
    elevation: appTheme.sizes.zero,
    toolbarHeight: appTheme.sizes.zero,
    backgroundColor: backgroundColor??appTheme.colors.pageBackgroundColor,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: appTheme.colors.transparent,
      // iOS status background
      statusBarBrightness: Brightness.light,
      // Android status icons
      statusBarIconBrightness: Brightness.dark,
    ),
  );
  static Widget defaultHeaderTextWidget (String titleStr) => Text(titleStr, style: TextStyle(fontSize: appTheme.sizes.titleBarTitleSize, color: appTheme.colors.textBlack, fontWeight: FontWeight.w500));
  static Widget defaultHeader ({
    Widget? title,
    String? titleStr,
    double? height,
    Color? bgColor,
    Map? backResult,
  }) {
    Color _bgColor = bgColor??appTheme.colors.pageBackgroundColor;
    double _height = height??appTheme.sizes.titleBarHeight;
    Widget? _title = title??(titleStr != null ? defaultHeaderTextWidget(titleStr) : null);
    return SizedBox(
      width: appTheme.sizes.infinity,
      height: _height,
      child: Material(
        color: _bgColor,
        child: Stack(
          children: [
            if (Get.key.currentState?.canPop() == true) Positioned(child: SizedBox(
              width: _height,
              height: _height,
              child: Center(
                child: IconButton(
                  splashColor: appTheme.colors.primaryColor.withOpacity(0.2),
                  hoverColor: appTheme.colors.primaryColor.withOpacity(0.1),
                  onPressed: () { Get.back(result: backResult); },
                  icon: Icon(Icons.arrow_back_ios, color: appTheme.colors.textBlack, size: appTheme.sizes.iconSize,),
                ),
              ),
            )),
            if (_title != null) Center(
              child: _title
            ),
          ],
        ),
      ),
    );
  }
  static Widget defaultTitle ({
    Widget? title,
    Widget? description,
  }) {
    return Container(
      padding: EdgeInsets.only(
        left: appTheme.sizes.padding,
        right: appTheme.sizes.padding,
        top: appTheme.sizes.basic * 15,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (title != null) title,
          if (description != null) Padding(child: description, padding: EdgeInsets.symmetric(vertical: appTheme.sizes.paddingSmall)),
        ],
      ),
    );
  }
  // static Widget defaultDescriptionList () {
  //   return Row(

  //   ),
  // }
}
