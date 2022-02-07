import 'package:get/get.dart';
import 'package:plug/app/ui/pages/chain/proposalDatails/proposalDetail.controller.dart';

class ChainProposalDetailsPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChainProposalDetailsPageController>(() => ChainProposalDetailsPageController());
  }
}