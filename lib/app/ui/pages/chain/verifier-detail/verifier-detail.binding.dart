import 'package:get/get.dart';
import 'package:plug/app/ui/pages/chain/verifier-detail/verifier-detail.controller.dart';

class ChainVerifierDetailPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChainVerifierDetailPageController>(() => ChainVerifierDetailPageController());
  }
}