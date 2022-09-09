import 'package:get/get.dart';
import 'package:plug/app/data/models/interface/interface.dart';
import 'package:plug/app/data/provider/data.account.dart';
import 'package:plug/app/data/services/net.services.dart';
import 'package:plug/app/ui/utils/string.dart';

class _DataToolServer {
  final List<TokenModel> _memTokenList = [];
  TransferLogModel? _memTransferLogItem;

  DataAccountController dataAccount = Get.find();

  _DataToolServer() {
    _initMemTokenList();
  }
  _initMemTokenList() {
    for (TokenModel item in dataAccount.state.nowAccount?.tokenList ?? []) {
      _memTokenList.add(TokenModel()..setData(item.toJson()));
    }
  }

  /// 获取代币信息
  Future<TokenModel> getTokenInfo(String _ident) async {
    for (TokenModel item in _memTokenList) {
      if (item.minUnit == _ident || item.contractAddress == _ident) {
        return TokenModel()..setData(item.toJson());
      }
    }
    if (StringTool.checkAddress(_ident)) {
      var _token =
          (await httpToolServer.searchToken20Info(_ident)).data?['token'];
      _memTokenList.add(TokenModel()..setData(_token.toJson()));
      return TokenModel()..setData(_token.toJson());
    } else {
      var _token =
          (await httpToolServer.searchToken10Info(_ident)).data?['token'];
      _memTokenList.add(TokenModel()..setData(_token.toJson()));
      return TokenModel()..setData(_token.toJson());
    }
  }

  setMemTransferLogItem(TransferLogModel item) {
    _memTransferLogItem = item;
  }

  TransferLogModel? get transferLogItem => _memTransferLogItem;
}

_DataToolServer dataToolServer = _DataToolServer();
