import 'package:get/get.dart';
import 'package:plug/app/data/provider/data.dapp-address.dart';
import 'package:plug/app/ui/components/function/bottomSheet.component.dart';
import 'package:plug/app/ui/components/function/toast.component.dart';

class DappCollectionPageState {}

class DappCollectionPageController extends GetxController {
  DappCollectionPageController();
  DappCollectionPageState state = DappCollectionPageState();

  // 获取收藏Dapp/最近的Dapp
  DataDappAddressController dataDappAddress = Get.find();

  onReorder(int oldIndex, int newIndex) {
    var _token = dataDappAddress.state.dappCollectList.removeAt(oldIndex);
    if (newIndex >= oldIndex) {
      dataDappAddress.state.dappCollectList.insert(newIndex - 1, _token);
    } else {
      dataDappAddress.state.dappCollectList.insert(newIndex, _token);
    }
    dataDappAddress.saveData();
  }

  onDeleteItem(int index) async {
    var res = await LBottomSheet.promptBottomSheet(
      title: 'deleteCollectionTip'.tr,
    );
    if (res != true) return;
    dataDappAddress.state.dappCollectList.removeAt(index);
    dataDappAddress.saveData();
    LToast.success('SuccessWithDelete'.tr);
  }
}
