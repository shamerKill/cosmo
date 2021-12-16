import 'dart:math';

import 'package:clipboard/clipboard.dart';
import 'package:get/get.dart';
import 'package:plug/app/data/models/interface/interface.dart';
import 'package:plug/app/ui/components/function/loading.component.dart';
import 'package:plug/app/ui/components/function/toast.component.dart';

class WalletTokenLogsDetailPageState {
  // 交易详情
  final Rx<TransferLogModel> _logDetail = TransferLogModel().obs;
  TransferLogModel get logDetail => _logDetail.value;
  set logDetail (TransferLogModel value) => _logDetail.value = value;
  // 类型
  final Rx<String> _logTypeTitle = ''.obs;
  String get logTypeTitle => _logTypeTitle.value;
  set logTypeTitle (String value) => _logTypeTitle.value = value;
}

class WalletTokenLogsDetailPageController extends GetxController {
  WalletTokenLogsDetailPageController();
  WalletTokenLogsDetailPageState state = WalletTokenLogsDetailPageState();

  @override
  onInit() {
    super.onInit();
    String? hash = Get.parameters['hash'];
    if (hash == null) return Get.back();
    _initDetail(hash);
  }

  @override
  onClose() {
    LLoading.dismiss();
  }

  // 初始化数据
  _initDetail(String hash) async {
    LLoading.showBgLoading();
    await Future.delayed(const Duration(seconds: 1));
    bool _random = Random().nextBool();
    state.logDetail = TransferLogModel()
      ..blockHeight = 10
      ..time = DateTime.now()
      ..status = _random ? TransferLogStatusEnum.success : TransferLogStatusEnum.fail
      ..type = _random ? TransferLogTypeEnum.receive : TransferLogTypeEnum.send
      ..hash = '5F6BA29583ABB097325D1C3A6A41D021E3440E793F68ABA5735D652DDD4BB0AF'
      ..memo = '这是备注哦................................................................'
      ..fee = (
        TokenModel()
          ..symbol = 'plugcn'
          ..minUnit = 'uplugcn'
          ..scale = 6
          ..amount = '200'
      )
      ..items = [
        TransferLogItemModel()
          ..toAddress = 'gxasodifj9asdflkjag09asdflkjasdg0asdfgxasodifj9asdflkjag09asdflkjasdg0asdf'
          ..formAddress = 'gxasodifj9asdflkjag09asdflkjasdg0asdfgxasodifj9asdflkjag09asdflkjasdg0asdf'
          ..coin = (
            TokenModel()
              ..symbol = 'plugcn'
              ..minUnit = 'uplugcn'
              ..scale = 6
              ..amount = '10086591238'
          ),
      ]
      ..rawLog = '''
        {}{}{}{}}}}}}{}{}}}[][][][][][]a[}{}{}{}{}[][]{}{}{][][][}{}{}[][][]909)()(0()()9)()()()()9009)()()()}{][]()()[}{}{])()(){P{{P{P{p()()([]{}{}89))()())_)_)()(){}{}{}()()_)(_)_)()({}{}{}{}{})}}}}}}]}]}]
      ''';
    _setTitle();
    LLoading.dismiss();
  }
  // 设置标题
  _setTitle() {
    switch (state.logDetail.type) {
      case TransferLogTypeEnum.send: state.logTypeTitle = '转出'; break;
      case TransferLogTypeEnum.receive: state.logTypeTitle = '转入'; break;
      case TransferLogTypeEnum.reDelegate: state.logTypeTitle = '转质押'; break;
      case TransferLogTypeEnum.pledge: state.logTypeTitle = '质押'; break;
      case TransferLogTypeEnum.unPledge: state.logTypeTitle = '取消质押'; break;
      case TransferLogTypeEnum.withdraw: state.logTypeTitle = '赎回首页'; break;
    }
  }
  // 复制文本
  onCopyText(String text) {
    FlutterClipboard.copy(text).then(( value ) => LToast.success('SuccessWithCopy'.tr));
  }
}