import 'package:get/get.dart';
import 'package:plug/app/routes/routes.dart';

class AccountChossePageState {
}

class AccountChossePageController extends GetxController {
  AccountChossePageController();
  AccountChossePageState state = AccountChossePageState();
  createWallet() {
    Get.toNamed(PlugRoutesNames.accountCreate);
  }
  importWallet() {
    Get.toNamed(PlugRoutesNames.accountImport);
  }
}