import 'package:get/get.dart';
import 'package:plug/app/routes/routes.dart';

class AccountBackupTipPageState {
}

class AccountBackupTipPageController extends GetxController {
  AccountBackupTipPageController();
  AccountBackupTipPageState state = AccountBackupTipPageState();

  void backupNow() {
    Get.toNamed(PlugRoutesNames.accountBackupShow);
  }
  void backupLate() {
    Get.toNamed(PlugRoutesNames.basicHome);
  }
}