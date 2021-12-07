import 'package:get/get.dart';
import 'package:plug/app/ui/pages/account/chosse/chosse.controller.dart';

class AccountChossePageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AccountChossePageController>(() => AccountChossePageController());
  }
}