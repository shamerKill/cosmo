import 'package:get/get.dart';
import 'package:plug/app/ui/pages/setting/my/my.controller.dart';

class UserMyPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserMyPageController>(() => UserMyPageController());
  }
}
