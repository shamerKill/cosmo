import 'package:get/get.dart';
import 'package:plug/app/ui/pages/account/admin/admin.controller.dart';

class AccountAdminPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AccountAdminPageController>(() => AccountAdminPageController());
  }
}