import 'package:get/get.dart';
import 'package:plug/app/ui/pages/dapp/exhibition/dapp.controller.dart';

class DappExhibitionPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DappExhibitionPageController>(() => DappExhibitionPageController());
  }
}