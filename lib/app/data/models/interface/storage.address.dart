part of './interface.dart';

/// 地址簿模型
class AddressModel extends _StorageBaseAbstract {
  /// id
  int get id => _id;
  set id (int value) { _id = value; _saveKey(); }
  int _id = 0;
  /// 名称
  String get name => _name;
  set name (String value) { _name = value; _saveKey(); }
  String _name = '';
  /// 备注
  String get remarks => _remarks;
  set remarks (String value) { _remarks = value; _saveKey(); }
  String _remarks = '';
  /// 地址
  String get address => _address;
  set address (String value) { _address = value; _saveKey(); }
  String _address = '';

  AddressModel._(): super();
  factory AddressModel() => create();
  static AddressModel create() => AddressModel._();

  @override
  void _saveKey(){
    _valueMap['name'] = name;
    _valueMap['remarks'] = remarks;
    _valueMap['address'] = address;
    _valueMap['id'] = id;
  }
  @override
  void setData(String sourceStr) {
    Map<String, dynamic> source = json.decode(sourceStr);
    name = source['name']??'';
    remarks = source['remarks']??'';
    address = source['address']??'';
    id = source['id']??0;
  }
}