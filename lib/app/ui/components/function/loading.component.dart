import 'package:flutter_easyloading/flutter_easyloading.dart';

class LLoading {
  static showLoading () {
    EasyLoading.show();
  }
  static showBgLoading() {
    EasyLoading.show(
      maskType: EasyLoadingMaskType.black,
    );
  }
  static dismiss () {
    EasyLoading.dismiss();
  }
}