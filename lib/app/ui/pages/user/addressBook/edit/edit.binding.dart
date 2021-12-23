import 'package:get/get.dart';
import 'package:plug/app/ui/pages/user/addressBook/edit/edit.controller.dart';

class UserAddressBookEditPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserAddressBookEditPageController>(() => UserAddressBookEditPageController());
  }
}