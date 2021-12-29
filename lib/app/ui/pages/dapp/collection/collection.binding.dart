import 'package:get/get.dart';
import 'package:plug/app/ui/pages/dapp/collection/collection.controller.dart';

class DappCollectionPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DappCollectionPageController>(() => DappCollectionPageController());
  }
}