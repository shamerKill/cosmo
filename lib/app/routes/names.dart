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
}