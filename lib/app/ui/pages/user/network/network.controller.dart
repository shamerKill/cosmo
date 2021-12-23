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
    LLoading.showBgLoading(text: '网络获取中'.tr);
    await Future.wait(
      [Future.delayed(const Duration(milliseconds: 1000)), Future.delayed(const Duration(milliseconds: 500))]
    );
    LLoading.dismiss();
    for (int i = 0; i < 3; i++) {
      state.mainNetList.add(
        NetWorkModel()
          ..id = i
          ..name = '主网$i.0'
          ..addressList = ['https://api.plugchain.network']
          ..type = 0
      );
    }
    for (int i = 1; i < 5; i++) {
      state.testNetList.add(
        NetWorkModel()
          ..id = i + 3
          ..name = '测试网$i.0'
          ..addressList = ['https://api.plugchain.network']
          ..type = 0
      );
    }
  }
  // 更改当前网络
  exchangeNoNet(int id, { required NetWorkModel network }) async {
    if (id == state.nowNetId) return;
    bool? result = await LBottomSheet.promptBottomSheet(
      title: '是否需要切换至当前网络？'.tr,
      message: Column(
        children: [
          Text('切换网络之后部分数据需要手动刷新'.tr, style: Get.textTheme.bodyText1),
        ],
      ),
    );
    if (result != true) return;
    LLoading.showBgLoading();
    await Future.delayed(const Duration(milliseconds: 1000));
    state.nowNetId = id;
    print(network.toJson());
    LLoading.dismiss();
  }
}