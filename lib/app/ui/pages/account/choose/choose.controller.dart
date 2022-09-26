import 'package:get/get.dart';
import 'package:plug/app/data/provider/data.account.dart';
import 'package:plug/app/routes/routes.dart';

class AccountChoosePageState {
  // 是否已经添加有账户
  final Rx<bool> _hadAccount = false.obs;
  bool get hadAccount => _hadAccount.value;
  set hadAccount (bool value) => _hadAccount.value = value;
}

class AccountChoosePageController extends GetxController {
  AccountChoosePageController();
  AccountChoosePageState state = AccountChoosePageState();
  final DataAccountController dataAccountController = Get.find();

  @override
  onReady() {
    state.hadAccount = dataAccountController.state.hadAccount;
  }

  createWallet() {
    Get.toNamed(PlugRoutesNames.accountCreate);
  }

  importWallet() {
    Get.toNamed(PlugRoutesNames.accountImport);
  }

  // 观察账户
  importWatchWallet() {
    Get.toNamed(PlugRoutesNames.watchAccountImport);
  }

  onChangeLanguage() {
    Get.toNamed(PlugRoutesNames.userLanguage);
  }
}
