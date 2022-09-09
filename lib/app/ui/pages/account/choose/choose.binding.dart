import 'package:get/get.dart';
import 'package:plug/app/ui/pages/account/choose/choose.controller.dart';

class AccountChoosePageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AccountChoosePageController>(
        () => AccountChoosePageController());
  }
}
