part of './interface.dart';

/// Dapp储存模型
class DappModel extends _StorageBaseAbstract {
  /// id
  int get id => _id;
  set id (int value) { _id = value; _saveKey(); }
  int _id = 0;
  /// 名称
  String get title => _title;
  set title (String value) { _title = value; _saveKey(); }
  String _title = '';
  /// logo
  String get logo => _logo;
  set logo (String value) { _logo = value; _saveKey(); }
  String _logo = '';
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
    _valueMap['title'] = title;
    _valueMap['logo'] = logo;
    _valueMap['description'] = description;
    _valueMap['address'] = address;
    _valueMap['id'] = id;
    _valueMap['permissions'] = permissions;
  }
  @override
  void setData(String sourceStr) {
    Map<String, dynamic> source = json.decode(sourceStr);
    title = source['title']??'';
    logo = source['logo']??'';
    description = source['description']??'';
    address = source['address']??'';
    id = source['id']??0;
    permissions = source['permissions'] != null ? source['permissions'].map<String>((item) => '$item').toList() : [];
  }
}


/// 远程Dapp列表头部模型
class DappRemoteTypeModel extends _StorageBaseAbstract {
  /// id
  int get id => _id;
  set id (int value) { _id = value; _saveKey(); }
  int _id = 0;
  /// 名称
  String get name => _name;
  set name (String value) { _name = value; _saveKey(); }
  String _name = '';

  DappRemoteTypeModel._(): super();
  factory DappRemoteTypeModel() => create();
  static DappRemoteTypeModel create() => DappRemoteTypeModel._();

  @override
  void _saveKey(){
    _valueMap['name'] = name;
    _valueMap['id'] = id;
  }
  @override
  void setData(String sourceStr) {
    Map<String, dynamic> source = json.decode(sourceStr);
    name = source['name']??'';
    id = source['id']??0;
  }
}
