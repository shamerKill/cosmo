import 'package:flutter/material.dart';

class AppColor {
  AppColor();
  Map<String, Color> colors = {};
  static ThemeColorClass get lightColors => ThemeColorClass(
    primaryColor: const Color(0xFF158878),
    transparent: Colors.transparent,
    hightColor: Colors.white,
    pageBackgroundColor: Colors.white,
    borderColor: const Color(0xffebedf6),
    textGray: const Color(0xffc8cad2),
    textBlack: const Color(0xFF222222),
  );
  static ThemeColorClass get darkColors => ThemeColorClass(
    primaryColor: const Color(0xFF856738),
    transparent: Colors.transparent,
    hightColor: Colors.yellow,
    pageBackgroundColor: Colors.white,
    borderColor: const Color(0xffebedf6),
    textGray: const Color(0xffc8cad2),
    textBlack: const Color(0xFF222222),
  );
}


class ThemeColorClass {
  final Color primaryColor;
  final Color transparent;
  final Color hightColor;
  final Color pageBackgroundColor;
  final Color borderColor;
  final Color textGray;
  final Color textBlack;
  ThemeColorClass({
    required this.primaryColor,
    required this.transparent,
    required this.hightColor,
    required this.pageBackgroundColor,
    required this.borderColor,
    required this.textGray,
    required this.textBlack,
  });
}