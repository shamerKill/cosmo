import 'package:get/get.dart';
import 'package:plug/app/ui/pages/setting/about/about.controller.dart';

class UserAboutPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserAboutPageController>(() => UserAboutPageController());
  }
}
