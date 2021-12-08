import 'package:get/get.dart';
import 'package:plug/app/ui/pages/user/my/my.controller.dart';

class UserMyPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserMyPageController>(() => UserMyPageController());
  }
}