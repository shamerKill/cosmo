import 'package:get/get.dart';
import 'package:plug/app/data/models/interface/interface.dart';
import 'package:plug/app/ui/components/function/toast.component.dart';

class DappCollectionPageState {
  // 收藏Dapp
  final RxList<DappModel> collectList = RxList<DappModel>();
}

class DappCollectionPageController extends GetxController {
  DappCollectionPageController();
  DappCollectionPageState state = DappCollectionPageState();

  @override
  onInit() {
    super.onInit();
    for (int i = 0; i < 10; i++) {
      state.collectList.add(
        DappModel()..address = 'https://www.baidu.com'
          ..id = i
          ..logo = 'https://www.baidu.com/favicon.ico'
          ..description = '百度一下你就知道$i'
          ..title = '百度搜索$i'
      );
    }
  }

  onReorder(int oldIndex, int newIndex) {
    var _token = state.collectList.removeAt(oldIndex);
    if (newIndex >= oldIndex) {
      state.collectList.insert(newIndex - 1, _token);
    } else {
      state.collectList.insert(newIndex, _token);
    }
  }
  onDeleteItem(int index) {
    state.collectList.removeAt(index);
    LToast.success('删除成功'.tr);
  }
}