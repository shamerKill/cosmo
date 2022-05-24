part of './routes.dart';

abstract class PlugRoutesNames {
  /// 动画/广告页
  static const start = '/';
  /// 广告页
  static const advertisement = '/advertisement';
  /// 首次进入页面(无地址)
  static const firstOpenWallet = '/firstOpenWallet';
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
  static const accountAdminEditPassword = '/accountAdminEditPassword';
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
  /// 钱包-代币列表
  static const walletTokenList = '/walletTokenList';
  /// 钱包-代币详情
  static walletTokenDetail (String token) => '/walletTokenDetail/$token';
  /// 生态-首页
  static const chainExport = '/chainExport';
  /// 生态-兑换详情
  static chainExchange (String tokenList) => '/chainExchange/$tokenList';
  // 生态-质押详情-转账
  static chainPledgeTransfer (String address) => '/chainPledgeTransfer/$address';
  /// 生态-提案详情
  static chainProposalDetails (String id) => '/chainProposalDetails/$id';
  /// 生态-节点列表
  static const chainVerifiersList = '/chainVerifiersList';
  /// 生态-节点详情
  /// type 是否已质押/0未质押/1已质押/null不显示按钮
  static chainVerifierDetail (String address, String type) => '/chainVerifierDetail/$address/$type';
  static chainVerifierDetailNull (String address) => '/chainVerifierDetailNull/$address/null';
  /// 生态-转质押
  static chainRePledge (String address) => '/chainVerifierRePledge/$address';
  /// 生态-赎回质押
  static chainBackupPledge (String address) => '/chainVerifierBackupPledge/$address';
  /// 生态-创建代币
  static const chainCreateToken = '/chainCreateToken';
  /// 社区-首页
  static const dappExhibition = '/dappExhibition';
  /// 社区-搜索
  static const dappSearch = '/dappSearch';
  /// 社区-收藏
  static const dappCollection = '/dappCollection';
  /// 社区-webview
  static const dappWebview = '/dappWebview';
  /// 我的-首页
  static const userMy = '/userMy';
  // 我的-地址簿列表
  static const userAddressBookList = '/userAddressBookList';
  // 我的-地址簿编辑
  static const userAddressBookEdit = '/userAddressBookEdit';
  // 我的-账户管理
  static const userAccountList = '/userAccountList';
  // 我的-DAPP设置
  static const userDappSetting = '/userDappSetting';
  // 我的-网络切换
  static const userNetwork = '/userNetwork';
  // 我的-语言切换
  static const userLanguage = '/userLanguage';
  // 我的-关于我们
  static const userAbout = '/userAbout';
  // 我的-问题反馈
  static const userProblems = '/userProblems';
  // 钱包-扫描二维码
  static const walletQrScanner = '/walletQrScanner';
}