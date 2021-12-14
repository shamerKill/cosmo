import 'package:get/get.dart';
import 'package:plug/app/ui/pages/account/admin/exitPassword/exitPassword.controller.dart';

class AccountExitPasswordPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AccountExitPasswordPageController>(() => AccountExitPasswordPageController());
  }
}