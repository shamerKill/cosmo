import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plug/app/env/env.dart';
import 'package:plug/app/ui/theme/color.dart';
import 'package:plug/app/ui/theme/size.dart';

_AppTheme appTheme = _AppTheme();

enum EnumThemeType {
  light,
  dart
}

class _AppTheme {
  _AppTheme();
  final ThemeData _lightTheme = _getTheme(AppColor.lightColors, AppSize());
  final ThemeData _darkTheme = _getTheme(AppColor.darkColors, AppSize());

  EnumThemeType _type = EnumThemeType.light;

  ThemeData get theme {
    if (_type == EnumThemeType.light) {
      return Env.envConfig.isRelease ? _lightTheme : _getTheme(AppColor.lightColors, sizes);
    } else if (_type == EnumThemeType.dart) {
      return Env.envConfig.isRelease ? _darkTheme : _getTheme(AppColor.darkColors, sizes);
    }
    return Env.envConfig.isRelease ? _lightTheme : _getTheme(AppColor.lightColors, sizes);
  }
  
  ThemeColorClass get colors {
    if (_type == EnumThemeType.light) {
      return AppColor.lightColors;
    } else if (_type == EnumThemeType.dart) {
      return AppColor.darkColors;
    }
    return AppColor.lightColors;
  }

  AppSize get sizes => AppSize();

  EnumThemeType get themeType => _type;
  
  changeTheme() {
    if (themeType == EnumThemeType.dart) {
      setTheme(EnumThemeType.light);
    } else {
      setTheme(EnumThemeType.dart);
    }
  }

  setTheme(EnumThemeType type) {
    switch (type) {
      case EnumThemeType.dart:
        _type = EnumThemeType.dart;
        break;
      case EnumThemeType.light:
        _type = EnumThemeType.light;
        break;
      default:
        _type = EnumThemeType.light;
        break;
    }
    Get.changeTheme(appTheme.theme);
    Get.forceAppUpdate();
  }
}

ThemeData _getTheme (ThemeColorClass colors, AppSize sizes) => ThemeData(
  platform: TargetPlatform.iOS,
  primaryColor: colors.primaryColor,
  backgroundColor: colors.pageBackgroundColor,
  scaffoldBackgroundColor: colors.pageBackgroundColor,
  textTheme: TextTheme(
    bodyText2: TextStyle(
      color: colors.textBlack,
      fontSize: sizes.fontSize,
    ),
    bodyText1: TextStyle(
      color: colors.textGray,
      fontSize: sizes.fontSizeSmall,
    ),
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: colors.primaryColor,
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: colors.primaryColor,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all(colors.primaryColor),
      textStyle: MaterialStateProperty.all(TextStyle(color: colors.hightColor)),
    ),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: ButtonStyle(
      foregroundColor: MaterialStateProperty.all(colors.primaryColor),
      overlayColor: MaterialStateProperty.all(colors.primaryColor.withOpacity(0.05)),
      textStyle: MaterialStateProperty.all(TextStyle(color: colors.hightColor)),
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      foregroundColor: MaterialStateProperty.all(colors.primaryColor),
      overlayColor: MaterialStateProperty.all(colors.primaryColor.withOpacity(0.05)),
    ),
  ),
  iconTheme: IconThemeData(
    color: colors.primaryColor,
  ),
  inputDecorationTheme: InputDecorationTheme(
    labelStyle: TextStyle(color: colors.textGray.withOpacity(0.5), fontSize: sizes.inputFontSize),
    floatingLabelStyle: TextStyle(color: colors.primaryColor.withOpacity(0.5)),
    hintStyle: TextStyle(color: colors.textGray.withOpacity(0.5), fontSize: sizes.inputFontSize),
    border: OutlineInputBorder(borderSide: BorderSide(color: colors.primaryColor.withOpacity(0.1))),
    enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: colors.textGray.withOpacity(0.1))),
    focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: colors.primaryColor)),
    fillColor: colors.textGray.withOpacity(0.05),
    contentPadding: EdgeInsets.symmetric(vertical: sizes.basic * 10, horizontal: sizes.basic * 20),
    filled: true,
  ),
  checkboxTheme: CheckboxThemeData(
    checkColor: MaterialStateProperty.all(colors.hightColor),
    fillColor: MaterialStateProperty.all(colors.primaryColor),
  ),
);
