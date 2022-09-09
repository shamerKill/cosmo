import 'package:get/get.dart';
import 'package:plug/app/ui/pages/chain/export/export.controller.dart';

class ChainExportPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChainExportPageController>(() => ChainExportPageController());
  }
}
