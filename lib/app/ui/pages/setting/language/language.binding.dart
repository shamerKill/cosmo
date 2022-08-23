import 'package:get/get.dart';
import 'package:plug/app/ui/pages/setting/language/language.controller.dart';

class UserLanguagePageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserLanguagePageController>(() => UserLanguagePageController());
  }
}