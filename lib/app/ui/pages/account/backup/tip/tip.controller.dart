import 'package:get/get.dart';
import 'package:plug/app/data/provider/data.account.dart';
import 'package:plug/app/routes/routes.dart';

class AccountBackupTipPageState {
}

class AccountBackupTipPageController extends GetxController {
  AccountBackupTipPageController();
  AccountBackupTipPageState state = AccountBackupTipPageState();
  final DataAccountController dataAccountController = Get.find();

  @override
  onReady() {
    if (dataAccountController.state.memAccount == null) return Get.back();
  }

  void backupNow() {
    Get.toNamed(PlugRoutesNames.accountBackupShow);
  }
  void backupLate() {
    dataAccountController.addAccount(dataAccountController.state.memAccount!);
    dataAccountController.state.memAccount = null;
    dataAccountController.state.memMnemonic = null;
    Get.toNamed(PlugRoutesNames.walletHome);
  }
}