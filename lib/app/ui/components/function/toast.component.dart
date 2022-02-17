import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:plug/app/ui/theme/theme.dart';
import 'package:get/get.dart';

// TODO: 提示样式
class LToast {
  static success(String message) {
    // FToast().init(Get.context!).showToast(
    //   child: Text('123123')
    // );
    Fluttertoast.showToast(
      msg: message,
      gravity: ToastGravity.CENTER,
      fontSize: appTheme.sizes.fontSize,
    );
  }
  static error(String message) {
    Fluttertoast.showToast(
      msg: message,
      gravity: ToastGravity.TOP,
      fontSize: appTheme.sizes.fontSize,
    );
  }
  static warning(String message) {
    Fluttertoast.showToast(
      msg: message,
      gravity: ToastGravity.TOP,
      fontSize: appTheme.sizes.fontSize,
    );
  }

  static info(String message) {
    Fluttertoast.showToast(
      msg: message,
      gravity: ToastGravity.TOP,
      fontSize: appTheme.sizes.fontSize,
    );
  }

  static log(String message) {
    Fluttertoast.showToast(
      msg: message,
      gravity: ToastGravity.TOP,
      fontSize: appTheme.sizes.fontSize,
    );
  }

}