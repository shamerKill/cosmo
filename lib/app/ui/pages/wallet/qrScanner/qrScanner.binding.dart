import 'package:get/get.dart';
import 'package:plug/app/ui/pages/wallet/qrScanner/qrScanner.controller.dart';

class WalletQrScannerPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WalletQrScannerPageController>(
        () => WalletQrScannerPageController());
  }
}
