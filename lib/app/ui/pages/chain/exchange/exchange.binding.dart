import 'package:get/get.dart';
import 'package:plug/app/ui/pages/chain/exchange/exchange.controller.dart';

class ChainExchangePageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChainExchangePageController>(() => ChainExchangePageController());
  }
}