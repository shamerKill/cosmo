import 'package:get/get.dart';
import 'package:plug/app/ui/pages/chain/backup-pledge/backup-pledge.controller.dart';

class ChainBackupPledgePageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChainBackupPledgePageController>(
        () => ChainBackupPledgePageController());
  }
}
