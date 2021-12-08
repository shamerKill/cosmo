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
      name: PlugRoutesNames.fristOpenWallet,
      page: () => const AccountChossePage(),
      binding: AccountChossePageBinding(),
    ),
    /// 创建账户
    GetPage(
      name: PlugRoutesNames.accountCreate,
      page: () => const AccountCreatePage(),
      binding: AccountCreateBinding()
    ),
    /// 导入地址
    GetPage(
      name: PlugRoutesNames.accountImport,
      page: () => const AccountImportPage(),
      binding: AccountImportPageBinding()
    ),
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
    /// 钱包-首页
    GetPage(
      name: PlugRoutesNames.basicHome,
      page: () => const BasicHomePage(),
      binding: BasicHomePageBinding(),
    ),
    // ExamplePage
    if (Env.envConfig.type != EnvType.release) GetPage(name: '/example', page: () => const ExamplePage(), binding: ExamplePageBinding()),
  ];
}
