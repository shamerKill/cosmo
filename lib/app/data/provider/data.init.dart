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
    // 初始化数据库
    await GetStorage.init();
    // 初始化代币信息
    var dataCoinController = DataCoinsController();
    await dataCoinController.init();
    Get.put(dataCoinController);
    Get.put(DataAccountController());
    Get.put(DataAddressController());
    Get.put(DataNotificationIdController());
    Get.put(DataDappAddressController());
    Get.put(DataConfigController());
  }
}
