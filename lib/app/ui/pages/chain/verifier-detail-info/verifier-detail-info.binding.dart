import 'package:get/get.dart';
import 'package:plug/app/ui/pages/chain/verifier-detail-info/verifier-detail-info.controller.dart';

class ChainVerifierDetailInfoPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChainVerifierDetailInfoPageController>(() => ChainVerifierDetailInfoPageController());
  }
}