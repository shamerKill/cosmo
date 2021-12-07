import 'package:get/instance_manager.dart';
import 'package:plug/app/ui/pages/example/example.controller.dart';

class ExamplePageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ExamplePageController>(() => ExamplePageController());
  }
}