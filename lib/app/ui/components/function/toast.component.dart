import 'package:fluttertoast/fluttertoast.dart';
import 'package:plug/app/ui/theme/theme.dart';

var _print = print;

// TODO: 提示样式
class LToast {
  static success(String message) {
    // FToast().init(Get.context!).showToast(
    //   child: Text('123123')
    // );
    return Fluttertoast.showToast(
      msg: message,
      gravity: ToastGravity.CENTER,
      fontSize: appTheme.sizes.fontSize,
    );
  }
  static error(String message) {
    return Fluttertoast.showToast(
      msg: message,
      gravity: ToastGravity.TOP,
      fontSize: appTheme.sizes.fontSize,
    );
  }
  static Future<void> warning(String message) {
    return Fluttertoast.showToast(
      msg: message,
      gravity: ToastGravity.TOP,
      fontSize: appTheme.sizes.fontSize,
    );
  }

  static info(String message) {
    return Fluttertoast.showToast(
      msg: message,
      gravity: ToastGravity.TOP,
      fontSize: appTheme.sizes.fontSize,
    );
  }

  static log(String message) {
    return Fluttertoast.showToast(
      msg: message,
      gravity: ToastGravity.TOP,
      fontSize: appTheme.sizes.fontSize,
    );
  }

  static print(String message) {
    _print(message);
  }

}