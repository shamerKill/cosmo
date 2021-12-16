part of './routes.dart';

abstract class PlugRoutesNames {
  /// 动画/广告页
  static const start = '/';
  /// 广告页
  static const advertisement = '/advertisement';
  /// 首次进入页面(无地址)
  static const fristOpenWallet = '/fristOpenWallet';
  /// 创建账户页面
  static const accountCreate = '/accountCreate';
  /// 导入地址页面
  static const accountImport = '/accountImport';
  /// 创建账户-提示备份助记词页
  static const accountBackupTip = '/accountBackupTip';
  /// 创建账户-显示助记词页
  static const accountBackupShow = '/accountBackupShow';
  /// 创建账户-验证助记词页
  static const accountBackupVerify = '/accountBackupVerify';
  /// 账户管理 /address
  static accountAdmin (String address) => '/accountAdmin/$address';
  /// 账户管理-验证 /address/type ('password|mnemonic')
  static accountAdminVerify (String address, String type) => '/accountAdmin/$address/$type';
  /// 账户管理-修改密码
  static accountAdminEditPassword (String mnemonic) => '/accountAdminEditPassword/$mnemonic';
  /// 钱包-首页
  static const walletHome = '/walletHome';
  /// 钱包-消息-列表
  static const walletNotification = '/walletNotification';
  /// 钱包-消息-详情
  static walletNotificationDetails (String id) => '/walletNotification/$id';
  /// 钱包-代币交易记录
  static walletTokenLogs (String token) => '/walletTokenLogs/$token';
  /// 钱包-代币交易记录详情
  static walletTokenLogsDetail (String hash) => '/walletTokenLogsDetail/$hash';
  /// 钱包-收款页面
  static walletTokenReceive (String token) => '/walletTokenReceive/$token';
  /// 钱包-转账
  static walletTokenSend (String token) => '/walletTokenSend/$token';
  /// 市场-首页
  static const chainExport = '/chainExport';
  /// 生态-首页
  static const dappExhibition = '/dappExhibition';
  /// 我的-首页
  static const userMy = '/userMy';
}