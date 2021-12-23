import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class LLoading {
  static showLoading () {
    EasyLoading.show();
  }
  static showBgLoading({
    String? text,
  }) {
    EasyLoading.show(
      maskType: EasyLoadingMaskType.black,
      status: text,
    );
  }
  static dismiss () {
    EasyLoading.dismiss();
  }
  static bool isShow() => EasyLoading.isShow;
}