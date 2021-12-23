part of './interface.dart';

/// Dapp储存模型
class DappModel extends _StorageBaseAbstract {
  /// id
  int get id => _id;
  set id (int value) { _id = value; _saveKey(); }
  int _id = 0;
  /// 名称
  String get name => _name;
  set name (String value) { _name = value; _saveKey(); }
  String _name = '';
  /// 描述
  String get description => _description;
  set description (String value) { _description = value; _saveKey(); }
  String _description = '';
  /// 网址
  String get address => _address;
  set address (String value) { _address = value; _saveKey(); }
  String _address = '';
  /// 权限列表
  List<String> get permissions => _permissions;
  set permissions (List<String> value) { _permissions = value; _saveKey(); }
  List<String> _permissions = [];

  DappModel._(): super();
  factory DappModel() => create();
  static DappModel create() => DappModel._();

  @override
  void _saveKey(){
    _valueMap['name'] = name;
    _valueMap['description'] = description;
    _valueMap['address'] = address;
    _valueMap['id'] = id;
    _valueMap['permissions'] = permissions;
  }
  @override
  void setData(String sourceStr) {
    Map<String, dynamic> source = json.decode(sourceStr);
    name = source['name']??'';
    description = source['description']??'';
    address = source['address']??'';
    id = source['id']??0;
  permissions = source['permissions']??[];
  }
}