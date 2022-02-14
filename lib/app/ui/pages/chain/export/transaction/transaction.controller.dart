import 'package:get/get.dart';
import 'package:plug/app/data/models/interface/interface.dart';
import 'package:plug/app/routes/routes.dart';

// 交易池
class TransitionPoolData {
  TransitionPoolData({
    required this.startToken,
    required this.endToken,
    required this.allValue,
    required this.transTime,
    required this.tokenRate,
    required this.id,
  });
  // 币种
  final TokenModel startToken;
  // 币种
  final TokenModel endToken;
  // 总流动性
  final String allValue;
  // 总交易次数
  final int transTime;
  // 兑换比率
  final String tokenRate;
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
        startToken: (TokenModel()..symbol='ETH')..logo = 'http://via.placeholder.com/40x40'..scale=2..amount='124123',
        endToken: (TokenModel()..symbol='PLUGCN')..logo = 'http://via.placeholder.com/41x41'..scale=0..amount='124123124',
        tokenRate: double.parse((1241.23 / 124123124).toStringAsFixed(5)).toString(),
      ),
    );
    state.poolLlist.add(
      TransitionPoolData(
        id: 2,
        allValue: '2284123.12',
        transTime: 59,
        startToken: (TokenModel()..symbol='WHDNNNNN')..logo = 'http://via.placeholder.com/40x40'..scale=6..amount='124123',
        endToken: (TokenModel()..symbol='PLUGCN')..logo = 'http://via.placeholder.com/41x41'..scale=8..amount='5612413',
        tokenRate: double.parse((0.124123 / 0.05612413).toStringAsFixed(5)).toString(),
      ),
    );
  }

  // 前往我的交易列表
  onGoToMyTransactionList() {}
  // 查看交易池详情
  onGoToPoolDetail(int id) {
    Get.toNamed(PlugRoutesNames.chainExchange(id.toString()));
  }
}