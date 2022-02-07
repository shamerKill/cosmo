import 'package:flutter/material.dart';

class AppColor {
  AppColor();
  Map<String, Color> colors = {};
  static ThemeColorClass get lightColors => ThemeColorClass(
    primaryColor: const Color(0xFF158878),
    transparent: Colors.transparent,
    hightColor: Colors.white,
    pageBackgroundColor: Colors.white,
    pageBackgroundColorBasic: const Color(0xFFF5F6FA),
    pageConTrastColor: Colors.black,
    borderColor: const Color(0xffebedf6),
    textGray: const Color(0xffc8cad2),
    textGrayBig: const Color(0xFF878E9F),
    textBlack: const Color(0xFF222222),
    textBlackBig: const Color(0xFF000000),
    errorColor: const Color(0xFFCC3300),
    warningColor: const Color(0xFFFFCC00),
    proposalAgree: const Color(0xFF06E2A6),
    proposalReject: const Color(0xFF000000),
    proposalVeto: const Color(0xFFCD464D),
    proposalAbandon: const Color(0xFFCFD5E5),
    homeAddressBg: [const Color(0xFF081327), const Color(0xFF060F19), const Color(0xFF172230)],
    homeAssetsBg: [const Color(0xFF05E6A8), const Color(0xFF158878)],
  );
  static ThemeColorClass get darkColors => ThemeColorClass(
    primaryColor: const Color(0xFF856738),
    transparent: Colors.transparent,
    hightColor: Colors.yellow,
    pageBackgroundColor: Colors.white,
    pageBackgroundColorBasic: const Color(0xFFF5F6FA),
    pageConTrastColor: Colors.black,
    borderColor: const Color(0xffebedf6),
    textGray: const Color(0xffc8cad2),
    textGrayBig: const Color(0xFF878E9F),
    textBlack: const Color(0xFF222222),
    textBlackBig: const Color(0xFF000000),
    errorColor: const Color(0xFFCC3300),
    warningColor: const Color(0xFFFFCC00),
    proposalAgree: const Color(0xFF06E2A6),
    proposalReject: const Color(0xFF000000),
    proposalVeto: const Color(0xFFCD464D),
    proposalAbandon: const Color(0xFFCFD5E5),
    homeAddressBg: [const Color(0xFF081327), const Color(0xFF060F19), const Color(0xFF172230)],
    homeAssetsBg: [const Color(0xFF05E6A8), const Color(0xFF158878)],
  );
}



class ThemeColorClass {
  final Color primaryColor;
  final Color transparent;
  final Color hightColor;
  final Color pageBackgroundColor;
  final Color pageBackgroundColorBasic;
  final Color pageConTrastColor;
  final Color borderColor;
  final Color textGray;
  final Color textGrayBig;
  final Color textBlack;
  final Color textBlackBig;
  final Color errorColor;
  final Color warningColor;
  final Color proposalAgree;
  final Color proposalReject;
  final Color proposalVeto;
  final Color proposalAbandon;
  final List<Color> homeAddressBg;
  final List<Color> homeAssetsBg;
  ThemeColorClass({
    required this.primaryColor,
    required this.transparent,
    required this.hightColor,
    required this.pageBackgroundColor,
    required this.pageBackgroundColorBasic,
    required this.borderColor,
    required this.textGray,
    required this.textBlack,
    required this.textBlackBig,
    required this.textGrayBig,
    required this.pageConTrastColor,
    required this.errorColor,
    required this.warningColor,
    required this.proposalAgree,
    required this.proposalReject,
    required this.proposalVeto,
    required this.proposalAbandon,
    required this.homeAddressBg,
    required this.homeAssetsBg,
  });
}