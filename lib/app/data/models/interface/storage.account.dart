part of './interface.dart';

enum enumAccountType {
  prc10,
  prc20
}

/// 账户模型
class AccountModel extends _StorageBaseAbstract {
  /// 账户地址
  String get address => _address;
  set address (String value) { _address = value; _saveKey(); }
  String _address = '';
  /// 账户别名
  String get nickName => _nickName;
  set nickName (String value) { _nickName = value; _saveKey(); }
  String _nickName = '';
  /// 加密助记词
  String get stringifyRaw => _stringifyRaw;
  set stringifyRaw (String value) { _stringifyRaw = value; _saveKey(); }
  String _stringifyRaw = '';
  /// 账户权重，权重越高，排位越高
  int get weight => _weight;
  set weight (int value) { _weight = value; _saveKey(); }
  int _weight = 0;
  /// 创建时间/存在时间时，判断超过三天提醒进行备份
  /// null代表已经备份过或者导入进来的
  DateTime? get createTime => _createTime;
  set createTime (DateTime? value) { _createTime = value; _saveKey(); }
  DateTime? _createTime;
  /// 账户储存的token列表
  List<TokenModel> get tokenList => _tokenList;
  set tokenList (List<TokenModel> value) { _tokenList = value; _saveKey(); }
  List<TokenModel> _tokenList = [];
  /// 账户质押节点列表
  List<UserVerifierModel> get verifierList => _verifierList;
  set verifierList (List<UserVerifierModel> value) { _verifierList = value; _saveKey(); }
  List<UserVerifierModel> _verifierList = [];
  /// 地址类型 prc10或者prc20
  enumAccountType get accountType => _accountType;
  set accountType (enumAccountType value) { _accountType = value; _saveKey(); }
  enumAccountType _accountType = enumAccountType.prc20;
  /// 账户储存的dapp权限列表
  List<DappModel> get dappPermissionList => _dappPermissionList;
  set dappPermissionList (List<DappModel> value) { _dappPermissionList = value; _saveKey(); }
  List<DappModel> _dappPermissionList = [];
  

  AccountModel._(): super();
  factory AccountModel() => create();
  static AccountModel create() => AccountModel._();

  @override
  void _saveKey(){
    _valueMap['address'] = address;
    _valueMap['nickName'] = nickName;
    _valueMap['stringifyRaw'] = stringifyRaw;
    _valueMap['weight'] = weight;
    _valueMap['createTime'] = createTime;
    _valueMap['tokenList'] = tokenList;
    _valueMap['verifierList'] = verifierList;
    _valueMap['accountType'] = StringTool.accountTypeToString(accountType);
    _valueMap['dappPermissionList'] = dappPermissionList;
  }
  @override
  void setData(String sourceStr) {
    Map<String, dynamic> source = json.decode(sourceStr);
    address = source['address']??'';
    nickName = source['nickName']??'';
    stringifyRaw = source['stringifyRaw']??'';
    weight = source['weight']??'';
    createTime = source['createTime'] != null ? DateTime.tryParse(source['createTime']) : null;
    accountType = StringTool.accountStringToType(source['accountType']);
    tokenList = (source['tokenList']??[]).map<TokenModel>((dynamic item) => TokenModel()..setData(item)).toList();
    verifierList = (source['verifierList']??[]).map<UserVerifierModel>((dynamic item) => UserVerifierModel()..setData(item)).toList();
    dappPermissionList = (source['dappPermissionList']??[]).map<DappModel>((dynamic item) => DappModel()..setData(item)).toList();
  }
}