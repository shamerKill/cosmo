import 'package:get/get.dart';
import 'package:plug/app/ui/pages/account/import_watch/import_watch.controller.dart';

class AccountImportWatchBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AccountImportWatchController>(() => AccountImportWatchController());
  }
}