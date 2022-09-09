import 'package:get/get.dart';
import 'package:plug/app/ui/pages/chain/create-token/create-token.controller.dart';

class ChainCreateTokenPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChainCreateTokenPageController>(
        () => ChainCreateTokenPageController());
  }
}
