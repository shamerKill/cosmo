part of './interface.dart';

/// 账户交易记录
class TransferLogModel extends _StorageBaseAbstract {
  /// 交易时间
  DateTime? get time => _time;
  set time (DateTime? value) { _time = value; _saveKey(); }
  DateTime? _time;
  /// 交易块高
  int get blockHeight => _blockHeight;
  set blockHeight (int value) { _blockHeight = value; _saveKey(); }
  int _blockHeight = 0;
  /// 备注
  String get memo => _memo;
  set memo (String value) { _memo = value; _saveKey(); }
  String _memo = '';
  /// 哈希
  String get hash => _hash;
  set hash (String value) { _hash = value; _saveKey(); }
  String _hash = '';
  /// 交易状态
  TransferLogStatusEnum get status => _status;
  set status (TransferLogStatusEnum value) { _status = value; _saveKey(); }
  TransferLogStatusEnum _status = TransferLogStatusEnum.pending;
  /// 手续费
  /// 
  /// tokenModel里amount代表使用费用
  TokenModel get fee => _fee;
  set fee (TokenModel value) { _fee = value; _saveKey(); }
  TokenModel _fee = TokenModel();
  /// 原始数据
  dynamic get rawLog => _rawLog;
  set rawLog (dynamic value) { _rawLog = value; _saveKey(); }
  dynamic _rawLog = '';
  
  TransferLogModel._(): super();
  factory TransferLogModel() => create();
  static TransferLogModel create() => TransferLogModel._();

  @override
  void _saveKey() {
    _valueMap['time'] = time;
    _valueMap['blockHeight'] = blockHeight;
    _valueMap['memo'] = memo;
    _valueMap['hash'] = hash;
    _valueMap['status'] = status;
    _valueMap['fee'] = fee;
    _valueMap['rawLog'] = rawLog;
  }
  @override
  void setData(String sourceStr) {
    Map<String, dynamic> source = json.decode(sourceStr);
    time = source['time'];
    blockHeight = source['blockHeight']??0;
    memo = source['memo']??'';
    hash = source['hash']??'';
    status = source['status']??TransferLogStatusEnum.success;
    fee = source['fee']??TokenModel();
    rawLog = source['rawLog']??'';
  }
}


/// 交易状态
enum TransferLogStatusEnum {
  /// 成功
  success,
  /// 失败
  fail,
  /// 交易中
  pending,
}