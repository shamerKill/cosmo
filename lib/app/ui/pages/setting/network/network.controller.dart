import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plug/app/data/models/interface/interface.dart';
import 'package:plug/app/ui/components/function/bottomSheet.component.dart';
import 'package:plug/app/ui/components/function/loading.component.dart';

class UserNetworkPageState {
  // 主网列表
  final RxList<NetWorkModel> mainNetList = RxList<NetWorkModel>();
  // 测试网列表
  final RxList<NetWorkModel> testNetList = RxList<NetWorkModel>();
  // 当前网络id
  final Rx<int> _nowNetId = 0.obs;
  int get nowNetId => _nowNetId.value;
  set nowNetId (int value) => _nowNetId.value = value;
}

class UserNetworkPageController extends GetxController {
  UserNetworkPageController();
  UserNetworkPageState state = UserNetworkPageState();


  @override
  onInit() async {
    super.onInit();
    _getNetList();
  }
  @override
  onClose() {
    LLoading.dismiss();
  }
  

  // 获取网络列表
  Future<void> _getNetList() async {
    LLoading.showBgLoading(text: 'networkFetching'.tr);
    LLoading.dismiss();
  }
  // 更改当前网络
  exchangeNoNet(int id, { required NetWorkModel network }) async {
    if (id == state.nowNetId) return;
    bool? result = await LBottomSheet.promptBottomSheet(
      title: 'switchNetworkTip'.tr,
      message: Column(
        children: [
          Text('switchNetworkDesc'.tr, style: Get.textTheme.bodyText1),
        ],
      ),
    );
    if (result != true) return;
    LLoading.showBgLoading();
    state.nowNetId = id;
    LLoading.dismiss();
  }
}