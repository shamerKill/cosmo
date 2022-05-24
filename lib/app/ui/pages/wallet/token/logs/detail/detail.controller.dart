import 'dart:convert';
import 'dart:math';

import 'package:clipboard/clipboard.dart';
import 'package:pretty_json/pretty_json.dart';
import 'package:get/get.dart';
import 'package:plug/app/data/models/interface/interface.dart';
import 'package:plug/app/data/provider/data.account.dart';
import 'package:plug/app/ui/components/function/loading.component.dart';
import 'package:plug/app/ui/components/function/toast.component.dart';
import 'package:plug/app/data/services/net.services.dart';

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

  DataAccountController dataAccount = Get.find();

  @override
  onReady() {
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
    var _res = await httpToolApp.getChainLogDetail(hash);
    var result = _res.data['tx_response'];
    if (result == null) return Get.back();
    // 判断类型
    TransferLogTypeEnum type = (() {
      for (var item in result['logs']) {
        for (var msg in item['events']) {
          // 转账
          if (msg['type'] == 'transfer') {
            for (var val in msg['attributes']) {
              // 发送
              if (val['key'] == 'sender') {
                if (val['value'] == dataAccount.state.nowAccount!.address) {
                  return TransferLogTypeEnum.send;
                }
              }
              // 接收
              if (val['key'] == 'recipient') {
                if (val['value'] == dataAccount.state.nowAccount!.address) {
                  return TransferLogTypeEnum.receive;
                }
              }
            }
          }
        }
      }
      return TransferLogTypeEnum.send;
    })();
    // 获取手续费
    TokenModel fee = await (() async {
      var _fee = result['tx']['auth_info']['fee']['amount'][0];
      var _feeMinUnit = _fee['denom'];
      var _feeAmount = _fee['amount'];
      var _token = await httpToolApp.getCoinInfo(_feeMinUnit);
      if (_token == null) return TokenModel();
      _token.amount = _feeAmount;
      return _token;
    })();
    // 获取交易列表
    List<TransferLogItemModel> transferList = await(() async {
      List<TransferLogItemModel> _list = [];
      for (var _log in result['logs']) {
        for (var _item in _log['events']) {
          if (_item['type'] == 'transfer') {
            var _logItem = TransferLogItemModel();
            for (var _val in _item['attributes']) {
              var _amount = '';
              var _minUnit = '';
              if (_val['key'] == 'recipient') _logItem.toAddress = _val['value'];
              if (_val['key'] == 'sender') _logItem.formAddress = _val['value'];
              if (_val['key'] == 'amount') {
                _amount = _val['value'].split(RegExp(r'[a-z]+'))[0];
                _minUnit = _val['value'].substring(_amount.length);
                var _token = await httpToolApp.getCoinInfo(_minUnit);
                if (_token != null) {
                  _token.amount = _amount;
                  _logItem.coin = _token;
                }
              }
            }
            _list.add(_logItem);
          }
        }
      }
      return _list;
    })();
    state.logDetail = TransferLogModel()
      ..blockHeight = int.parse(result['height'])
      ..time = DateTime.parse(result['timestamp'])
      ..status = result['code'] == 0 ? TransferLogStatusEnum.success : TransferLogStatusEnum.fail
      ..type = type
      ..hash = hash
      ..memo = result['tx']['body']['memo']
      ..fee = fee
      ..items = transferList
      ..rawLog = prettyJson(json.decode(result['raw_log']), indent: 2);
    _setTitle();
    LLoading.dismiss();
  }
  // 设置标题
  _setTitle() {
    switch (state.logDetail.type) {
      case TransferLogTypeEnum.send: state.logTypeTitle = '转出'.tr; break;
      case TransferLogTypeEnum.receive: state.logTypeTitle = '转入'.tr; break;
      case TransferLogTypeEnum.reDelegate: state.logTypeTitle = '转质押'.tr; break;
      case TransferLogTypeEnum.pledge: state.logTypeTitle = '质押'.tr; break;
      case TransferLogTypeEnum.unPledge: state.logTypeTitle = '取消质押'.tr; break;
      case TransferLogTypeEnum.withdraw: state.logTypeTitle = '赎回质押'.tr; break;
    }
  }
  // 复制文本
  onCopyText(String text) {
    FlutterClipboard.copy(text).then(( value ) => LToast.success('SuccessWithCopy'.tr));
  }
}