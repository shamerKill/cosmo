import 'package:get/get.dart';
import 'package:plug/app/routes/routes.dart';

class AccountChoosePageState {}

class AccountChoosePageController extends GetxController {
  AccountChoosePageController();
  AccountChoosePageState state = AccountChoosePageState();
  createWallet() {
    Get.toNamed(PlugRoutesNames.accountCreate);
  }

  importWallet() {
    Get.toNamed(PlugRoutesNames.accountImport);
  }

  onChangeLanguage() {
    Get.toNamed(PlugRoutesNames.userLanguage);
  }
}
