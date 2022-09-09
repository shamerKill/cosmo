import 'package:get/instance_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:plug/app/data/provider/data.account.dart';
import 'package:plug/app/data/provider/data.address.dart';
import 'package:plug/app/data/provider/data.base-coin.dart';
import 'package:plug/app/data/provider/data.config.dart';
import 'package:plug/app/data/provider/data.dapp-address.dart';
import 'package:plug/app/data/provider/data.notification-id.dart';

class DataInitState {
  static onInit() async {
    await GetStorage.init();
    Get.put(DataAccountController());
    Get.put(DataCoinsController());
    Get.put(DataAddressController());
    Get.put(DataNotificationIdController());
    Get.put(DataDappAddressController());
    Get.put(DataConfigController());
  }
}
