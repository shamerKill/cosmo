import 'package:get/get.dart';
import 'package:plug/app/ui/pages/account/create/accountCreate.controller.dart';

class AccountCreateBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AccountCreateController>(() => AccountCreateController());
  }
}
