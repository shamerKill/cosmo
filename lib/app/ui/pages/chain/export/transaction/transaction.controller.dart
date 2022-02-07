import 'package:get/get.dart';
import 'package:plug/app/data/models/interface/interface.dart';

// 交易池
class TransitionPoolData {
  TransitionPoolData({
    required this.startToken,
    required this.endToken,
    required this.allValue,
    required this.transTime,
    required this.id,
  });
  final TokenModel startToken;
  final TokenModel endToken;
  // 总流动性
  final String allValue;
  // 总交易次数
  final int transTime;
  // id
  final int id;
}

class ChainExportTransactionPageState {
  // 交易池列表
  RxList<TransitionPoolData> poolLlist = RxList();
}

class ChainExportTransactionPageController extends GetxController {
  ChainExportTransactionPageController();
  ChainExportTransactionPageState state = ChainExportTransactionPageState();

  @override
  onInit() {
    super.onInit();
    _onMockData();
  }

  // 模拟数据
  _onMockData() {
    state.poolLlist.add(
      TransitionPoolData(
        id: 1,
        allValue: '286391284123.12',
        transTime: 80,
        startToken: (TokenModel()..symbol='ETH')..logo = 'http://via.placeholder.com/40x40',
        endToken: (TokenModel()..symbol='PLUGCN')..logo = 'http://via.placeholder.com/41x41',
      ),
    );
    state.poolLlist.add(
      TransitionPoolData(
        id: 2,
        allValue: '2284123.12',
        transTime: 59,
        startToken: (TokenModel()..symbol='WHDNNNNN')..logo = 'http://via.placeholder.com/40x40',
        endToken: (TokenModel()..symbol='PLUGCN')..logo = 'http://via.placeholder.com/41x41',
      ),
    );
  }

  // 前往我的交易列表
  onGoToMyTransactionList() {}
  // 查看交易池详情
  onGoToPoolDetail(int id) {
    print(id);
  }
}