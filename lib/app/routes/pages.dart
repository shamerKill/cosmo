part of './routes.dart';

class PlugPages {
  static String start = PlugRoutesNames.start;
  static final List<GetPage> routes = [
    /// 启动页
    GetPage(
      name: PlugRoutesNames.start,
      page: () => const StartPage(),
      binding: StartPageBinding(),
    ),

    /// 首次进入页面(无地址)
    GetPage(
      name: PlugRoutesNames.firstOpenWallet,
      page: () => const AccountChoosePage(),
      binding: AccountChoosePageBinding(),
    ),

    /// 创建账户
    GetPage(
        name: PlugRoutesNames.accountCreate,
        page: () => const AccountCreatePage(),
        binding: AccountCreateBinding()),

    /// 导入地址
    GetPage(
        name: PlugRoutesNames.accountImport,
        page: () => const AccountImportPage(),
        binding: AccountImportPageBinding()),

    /// 创建账户-提示备份助记词
    GetPage(
      name: PlugRoutesNames.accountBackupTip,
      page: () => const AccountBackupTipPage(),
      binding: AccountBackupTipPageBinding(),
    ),

    /// 创建账户-显示助记词
    GetPage(
      name: PlugRoutesNames.accountBackupShow,
      page: () => const AccountBackupShowPage(),
      binding: AccountBackupShowPageBinding(),
    ),

    /// 创建账户-验证助记词
    GetPage(
      name: PlugRoutesNames.accountBackupVerify,
      page: () => const AccountBackupVerifyPage(),
      binding: AccountBackupVerifyPageBinding(),
    ),

    /// 账户管理
    GetPage(
      name: PlugRoutesNames.accountAdmin(':address'),
      page: () => const AccountAdminPage(),
      binding: AccountAdminPageBinding(),
    ),

    /// 账户管理-验证
    GetPage(
      name: PlugRoutesNames.accountAdminVerify(':address', ':type'),
      page: () => const AccountAdminVerifyPage(),
      binding: AccountAdminVerifyPageBinding(),
    ),

    /// 账户管理-修改密码
    GetPage(
      name: PlugRoutesNames.accountAdminEditPassword,
      page: () => const AccountExitPasswordPage(),
      binding: AccountExitPasswordPageBinding(),
    ),

    /// 钱包-首页
    GetPage(
      name: PlugRoutesNames.walletHome,
      page: () => const BasicHomePage(),
      binding: BasicHomePageBinding(),
      transition: Transition.fadeIn,
    ),

    /// 钱包-消息-列表
    GetPage(
      name: PlugRoutesNames.walletNotification,
      page: () => const WalletNotificationListPage(),
      binding: WalletNotificationListPageBinding(),
    ),

    /// 钱包-消息-详情
    GetPage(
      name: PlugRoutesNames.walletNotificationDetails(':id'),
      page: () => const WalletNotificationDetailsPage(),
      binding: WalletNotificationDetailsPageBinding(),
    ),

    /// 钱包-代币交易记录
    GetPage(
      name: PlugRoutesNames.walletTokenLogs(':token'),
      page: () => const WalletTokenLogsPage(),
      binding: WalletTokenLogsPageBinding(),
    ),

    /// 钱包-代币交易记录详情
    GetPage(
      name: PlugRoutesNames.walletTokenLogsDetail(':hash'),
      page: () => const WalletTokenLogsDetailPage(),
      binding: WalletTokenLogsDetailPageBinding(),
    ),

    /// 钱包-收款页面
    GetPage(
      name: PlugRoutesNames.walletTokenReceive(':token'),
      page: () => const WalletTokenReceivePage(),
      binding: WalletTokenReceivePageBinding(),
    ),

    /// 钱包-转账页面
    GetPage(
      name: PlugRoutesNames.walletTokenSend(':token'),
      page: () => const WalletTokenSendPage(),
      binding: WalletTokenSendPageBinding(),
    ),

    /// 钱包-代币列表
    GetPage(
      name: PlugRoutesNames.walletTokenList,
      page: () => const WalletTokenListPage(),
      binding: WalletTokenListPageBinding(),
    ),

    /// 钱包-代币详情
    GetPage(
      name: PlugRoutesNames.walletTokenDetail(':token'),
      page: () => const WalletTokenDetailPage(),
      binding: WalletTokenDetailPageBinding(),
    ),

    /// 生态-首页
    GetPage(
      name: PlugRoutesNames.chainExport,
      page: () => const ChainExportPage(),
      binding: ChainExportPageBinding(),
      transition: Transition.fadeIn,
    ),

    /// 生态-质押详情-转账
    GetPage(
      name: PlugRoutesNames.chainPledgeTransfer(':address'),
      page: () => const ChainPledgeTransferPage(),
      binding: ChainPledgeTransferPageBinding(),
    ),

    /// 生态-节点详情
    GetPage(
      name: PlugRoutesNames.chainVerifierDetail(':address', ':type'),
      page: () => const ChainVerifierDetailPage(),
      binding: ChainVerifierDetailPageBinding(),
    ),

    /// 生态-节点详情
    GetPage(
      name: PlugRoutesNames.chainVerifierDetailNull(':address'),
      page: () => const ChainVerifierDetailInfoPage(),
      binding: ChainVerifierDetailInfoPageBinding(),
    ),

    /// 生态-转让质押
    GetPage(
      name: PlugRoutesNames.chainRePledge(':address'),
      page: () => const ChainRePledgePage(),
      binding: ChainRePledgePageBinding(),
    ),

    /// 生态-赎回质押
    GetPage(
      name: PlugRoutesNames.chainBackupPledge(':address'),
      page: () => const ChainBackupPledgePage(),
      binding: ChainBackupPledgePageBinding(),
    ),

    /// 生态-提案详情
    GetPage(
      name: PlugRoutesNames.chainProposalDetails(':id'),
      page: () => const ChainProposalDetailsPage(),
      binding: ChainProposalDetailsPageBinding(),
    ),

    /// 生态-节点列表
    GetPage(
      name: PlugRoutesNames.chainVerifiersList,
      page: () => const ChainVerifiersPage(),
      binding: ChainVerifiersPageBinding(),
    ),

    /// 生态-创建代币
    GetPage(
      name: PlugRoutesNames.chainCreateToken,
      page: () => const ChainCreateTokenPage(),
      binding: ChainCreateTokenPageBinding(),
    ),

    /// 社区-首页
    GetPage(
      name: PlugRoutesNames.dappExhibition,
      page: () => const DappExhibitionPage(),
      binding: DappExhibitionPageBinding(),
      transition: Transition.fadeIn,
    ),

    /// 社区-搜索
    GetPage(
      name: PlugRoutesNames.dappSearch,
      page: () => const DappSearchPage(),
      binding: DappSearchPageBinding(),
    ),

    /// 社区-webview
    GetPage(
      name: PlugRoutesNames.dappWebview,
      page: () => const DappWebviewPage(),
      binding: DappWebviewPageBinding(),
    ),
    GetPage(
      name: PlugRoutesNames.dappWebviewRoute(':link'),
      page: () => const DappWebviewPage(),
      binding: DappWebviewPageBinding(),
    ),

    /// 社区-收藏
    GetPage(
      name: PlugRoutesNames.dappCollection,
      page: () => const DappCollectionPage(),
      binding: DappCollectionPageBinding(),
    ),

    /// 我的-首页
    GetPage(
      name: PlugRoutesNames.userMy,
      page: () => const UserMyPage(),
      binding: UserMyPageBinding(),
      transition: Transition.fadeIn,
    ),

    /// 我的-地址簿列表
    GetPage(
      name: PlugRoutesNames.userAddressBookList,
      page: () => const UserAddressBookListPage(),
      binding: UserAddressBookListPageBinding(),
    ),

    /// 我的-地址簿编辑
    GetPage(
      name: PlugRoutesNames.userAddressBookEdit,
      page: () => const UserAddressBookEditPage(),
      binding: UserAddressBookEditPageBinding(),
    ),

    /// 我的-账户管理
    GetPage(
      name: PlugRoutesNames.userAccountList,
      page: () => const UserAccountListPage(),
      binding: UserAccountListPageBinding(),
    ),

    /// 我的-DAPP设置
    GetPage(
      name: PlugRoutesNames.userDappSetting,
      page: () => const UserDappSettingPage(),
      binding: UserDappSettingPageBinding(),
    ),

    /// 我的-网络切换
    GetPage(
      name: PlugRoutesNames.userNetwork,
      page: () => const UserNetworkPage(),
      binding: UserNetworkPageBinding(),
    ),

    /// 我的-语言切换
    GetPage(
      name: PlugRoutesNames.userLanguage,
      page: () => const UserLanguagePage(),
      binding: UserLanguagePageBinding(),
    ),

    /// 我的-关于我们
    GetPage(
      name: PlugRoutesNames.userAbout,
      page: () => const UserAboutPage(),
      binding: UserAboutPageBinding(),
    ),

    /// 我的-问题反馈
    GetPage(
      name: PlugRoutesNames.userProblems,
      page: () => const UserProblemsPage(),
      binding: UserProblemsPageBinding(),
    ),

    /// 我的-扫描二维码
    GetPage(
      name: PlugRoutesNames.walletQrScanner,
      page: () => const WalletQrScannerPage(),
      binding: WalletQrScannerPageBinding(),
    ),
    // ExamplePage
    if (Env.envConfig.type != EnvType.release)
      GetPage(
          name: '/example',
          page: () => const ExamplePage(),
          binding: ExamplePageBinding()),
  ];
}
