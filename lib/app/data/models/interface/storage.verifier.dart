part of './interface.dart';

/// 节点状态
enum VerifierStatusEnum {
  /// 运行中
  running,
  /// 监禁中
  jailing,
  /// 离线中
  offLine,
  /// 已失效
  invalid,
}

/// 节点模型
class VerifierModel extends _StorageBaseAbstract {
  /// 节点状态
  VerifierStatusEnum get status => _status;
  set status (VerifierStatusEnum value) { _status = value; _saveKey(); }
  VerifierStatusEnum _status = VerifierStatusEnum.running;
  /// 节点头像
  String get avatar => _avatar;
  set avatar (String value) { _avatar = value; _saveKey(); }
  String _avatar = '';
  /// 节点昵称
  String get nickName => _nickName;
  set nickName (String value) { _nickName = value; _saveKey(); }
  String _nickName = '';
  /// 节点地址
  String get address => _address;
  set address (String value) { _address = value; _saveKey(); }
  String _address = '';
  /// 预计年化收益率
  String get yieldRate => _yieldRate;
  set yieldRate (String value) { _yieldRate = value; _saveKey(); }
  String _yieldRate = '';
  /// 节点收取比例
  String get cutRate => _cutRate;
  set cutRate (String value) { _cutRate = value; _saveKey(); }
  String _cutRate = '';
  /// 全部委托数量
  String get allPledged => _allPledged;
  set allPledged (String value) { _allPledged = value; _saveKey(); }
  String _allPledged = '';
  /// 最小质押数量
  String get minPledgeVolume => _minPledgeVolume;
  set minPledgeVolume (String value) { _minPledgeVolume = value; _saveKey(); }
  String _minPledgeVolume = '';

  VerifierModel._(): super();
  factory VerifierModel() => create();
  static VerifierModel create() => VerifierModel._();

  @override
  void _saveKey() {
    _valueMap['status'] = status;
    _valueMap['avatar'] = avatar;
    _valueMap['nickName'] = nickName;
    _valueMap['address'] = address;
    _valueMap['yieldRate'] = yieldRate;
    _valueMap['cutRate'] = cutRate;
    _valueMap['allPledged'] = allPledged;
    _valueMap['minPledgeVolume'] = minPledgeVolume;
  }
  @override
  void setData(String sourceStr) {
    Map<String, dynamic> source = json.decode(sourceStr);
    // status
    switch (source['status']??VerifierStatusEnum.running) {
      case 'verifierStatusEnum.running': status = VerifierStatusEnum.running; break;
      case 'verifierStatusEnum.jailing': status = VerifierStatusEnum.jailing; break;
      case 'verifierStatusEnum.offLine': status = VerifierStatusEnum.offLine; break;
      case 'verifierStatusEnum.invalid': status = VerifierStatusEnum.invalid; break;
      default: status = VerifierStatusEnum.running; break;
    }
    avatar = source['avatar'];
    avatar = source['nickName']??'';
    avatar = source['address']??'';
    avatar = source['yieldRate']??'';
    avatar = source['cutRate']??'';
    avatar = source['allPledged']??'';
    avatar = source['minPledgVolume']??'';
  }
  
  // 设置节点状态
  setStatus(String type) {
    switch(type) {
      case 'BOND_STATUS_UNSPECIFIED':
        status = VerifierStatusEnum.invalid; break;
      case 'BOND_STATUS_UNBONDED':
        status = VerifierStatusEnum.offLine; break;
      case 'BOND_STATUS_UNBONDING':
        status = VerifierStatusEnum.jailing; break;
      case 'BOND_STATUS_BONDED':
        status = VerifierStatusEnum.running; break;
      default:
        status = VerifierStatusEnum.running; break;
    }
  }
}


/// 已质押节点模型
class UserVerifierModel extends VerifierModel {
  /// 已委托数量
  String get pledged => _pledged;
  set pledged (String value) { _pledged = value; _saveKey(); }
  String _pledged = '';
  /// 奖励数量
  String get reward => _reward;
  set reward (String value) { _reward = value; _saveKey(); }
  String _reward = '';
  /// 转质押锁定中数量
  String get rePledging => _rePledging;
  set rePledging (String value) { _rePledging = value; _saveKey(); }
  String _rePledging = '';
  /// 赎回锁定中数量
  String get redeeming => _redeeming;
  set redeeming (String value) { _redeeming = value; _saveKey(); }
  String _redeeming = '';



  UserVerifierModel._(): super._();
  factory UserVerifierModel() => create();
  static UserVerifierModel create() => UserVerifierModel._();

  @override
  void _saveKey(){
    _valueMap['status'] = status;
    _valueMap['avatar'] = avatar;
    _valueMap['nickName'] = nickName;
    _valueMap['address'] = address;
    _valueMap['yieldRate'] = yieldRate;
    _valueMap['cutRate'] = cutRate;
    _valueMap['allPledged'] = allPledged;
    _valueMap['minPledgeVolume'] = minPledgeVolume;
    _valueMap['pledged'] = pledged;
    _valueMap['reward'] = reward;
    _valueMap['rePledging'] = rePledging;
    _valueMap['redeeming'] = redeeming;
  }
  @override
  void setData(String sourceStr) {
    Map<String, dynamic> source = json.decode(sourceStr);
    // status
    switch (source['status']??VerifierStatusEnum.running) {
      case 'verifierStatusEnum.running': status = VerifierStatusEnum.running; break;
      case 'verifierStatusEnum.jailing': status = VerifierStatusEnum.jailing; break;
      case 'verifierStatusEnum.offLine': status = VerifierStatusEnum.offLine; break;
      case 'verifierStatusEnum.invalid': status = VerifierStatusEnum.invalid; break;
      default: status = VerifierStatusEnum.running; break;
    }
    avatar = source['avatar']??'${Env.envConfig.assets.verifierAvatarUrl}/default/image.png';
    avatar = source['nickName']??'';
    avatar = source['address']??'';
    avatar = source['yieldRate']??'';
    avatar = source['cutRate']??'';
    avatar = source['allPledged']??'';
    avatar = source['minPledgeVolume']??'';
    pledged = source['pledged'];
    reward = source['reward'];
    rePledging = source['rePledging'];
    redeeming = source['redeeming'];
  }
}