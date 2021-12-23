import 'package:get/get.dart';
import 'package:plug/app/ui/pages/user/language/language.controller.dart';

class UserLanguagePageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserLanguagePageController>(() => UserLanguagePageController());
  }
}