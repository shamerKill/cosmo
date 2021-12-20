import 'package:get/get.dart';
import 'package:plug/app/ui/pages/user/addressBook/list/list.controller.dart';

class UserAddressBookListPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserAddressBookListPageController>(() => UserAddressBookListPageController());
  }
}