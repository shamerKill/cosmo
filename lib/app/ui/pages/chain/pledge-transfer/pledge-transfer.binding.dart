import 'package:get/get.dart';
import 'package:plug/app/ui/pages/chain/pledge-transfer/pledge-transfer.controller.dart';

class ChainPledgeTransferPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChainPledgeTransferPageController>(() => ChainPledgeTransferPageController());
  }
}