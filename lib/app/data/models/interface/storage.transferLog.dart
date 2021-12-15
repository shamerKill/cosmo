part of './interface.dart';

/// 账户交易记录
class TransferLogModel extends _StorageBaseAbstract {
  /// 账户交易类型
  TransferLogTypeEnum get type => _type;
  set type (TransferLogTypeEnum value) { _type = value; _saveKey(); }
  TransferLogTypeEnum _type = TransferLogTypeEnum.receive;
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
  /// 交易内容
  List<TransferLogItemModel> get items => _items;
  set items (List<TransferLogItemModel> value) { _items = value; _saveKey(); }
  List<TransferLogItemModel> _items = [];
  /// 手续费
  /// 
  /// tokenModel里amount代表使用费用
  TokenModel get fee => _fee;
  set fee (TokenModel value) { _fee = value; _saveKey(); }
  TokenModel _fee = TokenModel();
  /// 原始数据
  String get rawLog => _rawLog;
  set rawLog (String value) { _rawLog = value; _saveKey(); }
  String _rawLog = '';
  
  TransferLogModel._(): super();
  factory TransferLogModel() => create();
  static TransferLogModel create() => TransferLogModel._();

  @override
  void _saveKey() {
    _valueMap['type'] = type;
  }
  @override
  void setData(String sourceStr) {
    Map<String, dynamic> source = json.decode(sourceStr);
  }
}

/// 账户交易单条记录
class TransferLogItemModel extends _StorageBaseAbstract {
  /// 发送方
  String get formAddress => _formAddress;
  set formAddress (String value) { _formAddress = value; _saveKey(); }
  String _formAddress = '';
  /// 接收方
  String get toAddress => _toAddress;
  set toAddress (String value) { _toAddress = value; _saveKey(); }
  String _toAddress = '';
  /// 交易代币数量
  /// 
  /// tokenModel里amount代表转账数量
  TokenModel get coin => _coin;
  set coin (TokenModel value) { _coin = value; _saveKey(); }
  TokenModel _coin = TokenModel();

  TransferLogItemModel._(): super();
  factory TransferLogItemModel() => create();
  static TransferLogItemModel create() => TransferLogItemModel._();

  @override
  void _saveKey() {
  }
  @override
  void setData(String sourceStr) {
    Map<String, dynamic> source = json.decode(sourceStr);
  }
}



/// 账户交易类型
enum TransferLogTypeEnum {
  /// 转入
  receive,
  /// 发送
  send,
  /// 质押
  pledge,
  /// 取消质押
  unPledge,
  /// 质押
  withdraw,
  /// 转质押
  reDelegate,
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