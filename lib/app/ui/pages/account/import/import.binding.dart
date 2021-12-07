import 'package:get/get.dart';
import 'package:plug/app/ui/pages/account/import/import.controller.dart';

class AccountImportPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AccountImportPageController>(() => AccountImportPageController());
  }
}