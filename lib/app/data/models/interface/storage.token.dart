part of './interface.dart';

enum EnumTokenType { prc10, prc20 }

/// 代币模型
class TokenModel extends _StorageBaseAbstract {
  /// 代币单位/简称
  String get symbol => _symbol;
  set symbol(String value) {
    _symbol = value;
    _saveKey();
  }

  String _symbol = '';

  /// 币种名称/全称
  String get name => _name;
  set name(String value) {
    _name = value;
    _saveKey();
  }

  String _name = '';

  /// 初始发行量
  String get initialSupply => _initialSupply;
  set initialSupply(String value) {
    _initialSupply = value;
    _saveKey();
  }

  String _initialSupply = '';

  /// 最大发行量
  String get maxSupply => _maxSupply;
  set maxSupply(String value) {
    _maxSupply = value;
    _saveKey();
  }

  String _maxSupply = '';

  /// 最小单位
  String get minUnit => _minUnit;
  set minUnit(String value) {
    _minUnit = value;
    _saveKey();
  }

  String _minUnit = '';

  /// 拥有者地址
  String get owner => _owner;
  set owner(String value) {
    _owner = value;
    _saveKey();
  }

  String _owner = '';

  /// 小数点位数/精度
  int get scale => _scale;
  set scale(int value) {
    _scale = value;
    _saveKey();
  }

  int _scale = 0;

  /// 是否可增发
  bool get mintable => _mintable;
  set mintable(bool value) {
    _mintable = value;
    _saveKey();
  }

  bool _mintable = false;

  /// 币种备注 暂时无用
  String get remarks => _remarks;
  set remarks(String value) {
    _remarks = value;
    _saveKey();
  }

  String _remarks = '';

  /// 币种单价
  String get price => _price;
  set price(String value) {
    _price = value;
    _saveKey();
  }

  String _price = '';

  /// 数量
  String get amount => _amount;
  set amount(String value) {
    _amount = value;
    _saveKey();
  }

  String _amount = '';

  /// 币种logo
  String get logo => _logo;
  set logo(String value) {
    _logo = value;
    _saveKey();
  }

  String _logo = '';

  /// 币种类型
  EnumTokenType get type => _type;
  set type(EnumTokenType value) {
    _type = value;
    _saveKey();
  }

  EnumTokenType _type = EnumTokenType.prc10;

  /// 合约地址
  String get contractAddress => _contractAddress;
  set contractAddress(String value) {
    _contractAddress = value;
    _saveKey();
  }

  String _contractAddress = '';

  TokenModel._() : super();
  factory TokenModel() => create();
  static TokenModel create() => TokenModel._();

  @override
  void _saveKey() {
    _valueMap['symbol'] = symbol;
    _valueMap['name'] = name;
    _valueMap['initialSupply'] = initialSupply;
    _valueMap['maxSupply'] = maxSupply;
    _valueMap['minUnit'] = minUnit;
    _valueMap['owner'] = owner;
    _valueMap['scale'] = scale;
    _valueMap['mintable'] = mintable;
    _valueMap['remarks'] = remarks;
    _valueMap['amount'] = amount;
    _valueMap['logo'] = logo;
    _valueMap['type'] = StringTool.tokenTypeToString(type);
    _valueMap['contractAddress'] = contractAddress;
  }

  @override
  void setData(String sourceStr) {
    Map<String, dynamic> source = json.decode(sourceStr);
    symbol = source['symbol'] ?? '';
    name = source['name'] ?? '';
    initialSupply = source['initialSupply'] ?? '';
    maxSupply = source['maxSupply'] ?? '';
    minUnit = source['minUnit'] ?? '';
    owner = source['owner'] ?? '';
    scale = source['scale'] ?? 0;
    mintable = source['mintable'] ?? false;
    remarks = source['remarks'] ?? '';
    amount = source['amount'] ?? '';
    logo = source['logo'] ?? '';
    price = source['price'] ?? '';
    type = StringTool.tokenStringToType(source['type']);
    contractAddress = source['contractAddress'] ?? '';
  }
}
