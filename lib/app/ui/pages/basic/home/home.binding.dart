import 'package:get/get.dart';
import 'package:plug/app/ui/pages/basic/home/home.controller.dart';

class BasicHomePageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BasicHomePageController>(() => BasicHomePageController());
  }
}