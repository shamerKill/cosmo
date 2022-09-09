import 'package:get/get.dart';
import 'package:plug/app/ui/pages/account/admin/verify/verify.controller.dart';

class AccountAdminVerifyPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AccountAdminVerifyPageController>(
        () => AccountAdminVerifyPageController());
  }
}
