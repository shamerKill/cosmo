import 'package:get/get.dart';
import 'package:plug/app/ui/pages/chain/verifiers/verifiers.controller.dart';

class ChainVerifiersPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChainVerifiersPageController>(
        () => ChainVerifiersPageController());
  }
}
