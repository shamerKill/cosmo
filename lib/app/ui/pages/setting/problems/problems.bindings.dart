import 'package:get/get.dart';
import 'package:plug/app/ui/pages/setting/problems/problems.controller.dart';

class UserProblemsPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserProblemsPageController>(() => UserProblemsPageController());
  }
}