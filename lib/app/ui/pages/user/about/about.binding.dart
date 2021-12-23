import 'package:get/get.dart';
import 'package:plug/app/ui/pages/user/about/about.controller.dart';

class UserAboutPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserAboutPageController>(() => UserAboutPageController());
  }
}