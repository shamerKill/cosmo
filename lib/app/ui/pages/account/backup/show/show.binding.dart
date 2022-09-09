import 'package:get/get.dart';
import 'package:plug/app/ui/pages/account/backup/show/show.controller.dart';

class AccountBackupShowPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AccountBackupShowPageController>(
        () => AccountBackupShowPageController());
  }
}
