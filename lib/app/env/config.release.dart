part of './env.dart';

class _AssetsConfigRelease implements _AssetsConfig {
  @override
  String verifierAvatarUrl = 'https://api.plugchain.network/static';
  @override
  String accountDefaultPre = 'cosmo';
}

class _ChainInfoRelease implements _ChainInfo {
  @override
  String appChainId = 'plugchain_520-1';
  @override
  String addressPrefix = 'gx';
  @override
  int pvmChainId = 520;
}

class _UrlInfoRelease implements _UrlInfo {
  @override
  String backEndSite = 'https://wallet.plugchain.network';
  @override
  String chainToolRpcUrl = 'https://api.plugchain.network/rawrpc';
  @override
  String chainInfoRpcUrl = 'https://api.plugchain.network/rawapi';
  @override
  String chainMoreRpcUrl = 'https://wallet.plugchain.network/web_rpc';
  @override
  String chainPvmRpcUrl = 'https://wallet.plugchain.network/ethraw/';
}