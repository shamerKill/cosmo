import 'package:get/get.dart';
import 'package:plug/app/ui/pages/dapp/webview/webview.controller.dart';

class DappWebviewPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DappWebviewPageController>(() => DappWebviewPageController());
  }
}
