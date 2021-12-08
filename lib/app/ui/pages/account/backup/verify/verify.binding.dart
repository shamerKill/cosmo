import 'package:get/get.dart';
import 'package:plug/app/ui/pages/account/backup/verify/verify.controller.dart';

class AccountBackupVerifyPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AccountBackupVerifyPageController>(() => AccountBackupVerifyPageController());
  }
}