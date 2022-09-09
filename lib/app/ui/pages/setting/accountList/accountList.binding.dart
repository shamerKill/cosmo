import 'package:get/get.dart';
import 'package:plug/app/ui/pages/setting/accountList/accountList.controller.dart';

class UserAccountListPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserAccountListPageController>(
        () => UserAccountListPageController());
  }
}
