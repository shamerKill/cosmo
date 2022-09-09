import 'package:get/get.dart';
import 'package:plug/app/ui/pages/dapp/search/search.controller.dart';

class DappSearchPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DappSearchPageController>(() => DappSearchPageController());
  }
}
