import 'package:get/instance_manager.dart';
import 'package:plug/app/ui/pages/start/start.controller.dart';

class StartPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StartPageController>(() => StartPageController());
  }
}
