import 'package:get/get.dart';
import 'package:plug/app/ui/pages/account/backup/tip/tip.controller.dart';

class AccountBackupTipPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AccountBackupTipPageController>(
        () => AccountBackupTipPageController());
  }
}
