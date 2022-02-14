import 'package:get/get.dart';
import 'package:plug/app/ui/pages/chain/re-pledge/re-pledge.controller.dart';

class ChainRePledgePageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChainRePledgePageController>(() => ChainRePledgePageController());
  }
}