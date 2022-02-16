import 'package:get/instance_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:plug/app/data/provider/data.account.dart';

class DataInitState {
  static onInit() async {
    await GetStorage.init();
    Get.put(DataAccountController());
  }
}