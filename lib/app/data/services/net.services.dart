import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:plug/app/env/env.dart';
import 'package:plug/app/ui/utils/evm/evm_client.dart';
import 'package:plug/app/ui/utils/string.dart';
import 'package:plug/app/ui/utils/http.dart';
import 'package:plug/app/data/models/interface/interface.dart';

// 本地默认代币信息
TokenModel localDefaultCoinInfo = _resFormatToToken(jsonDecode('''{
  "@type": "/plugchain.prc10.Token",
  "symbol": "pc",
  "name": "plughub staking token",
  "scale": 6,
  "min_unit": "uplugcn",
  "initial_supply": "15989000000",
  "max_supply": "100000000000",
  "mintable": false,
  "owner": "gx1fjljkcf5f9ceh9cu54z7pp9wtmm586r2fm5gde",
  "logo": "https://www.gxswap.io/pc-logo.jpg"
  }'''));
TokenModel localPUSDCoinInfo = _resFormatToToken(jsonDecode('''{
  "@type": "/plugchain.prc20.Token",
  "symbol": "pusd",
  "name": "PLUG USD",
  "scale": 18,
  "min_unit": "pusd",
  "logo": "https://pc-token-logo.oss-ap-southeast-1.aliyuncs.com/gx1jqulxg07n2cg8wtjkc457w650a3av3xdl5rauc.jpg"
  }'''), type: EnumTokenType.prc20, contractAddress: 'gx1jqulxg07n2cg8wtjkc457w650a3av3xdl5rauc');

// 1317接口信息
class _HttpToolApp extends UriTool {
  _HttpToolApp() : super(Env.envConfig.urlInfo.chainInfoRpcUrl);

  // 获取主链年化收益率
  Future<String> getChainRate() {
    return HttpToolClient.getHttp(customUri('/cosmos/mint/v1beta1/inflation'))
        .then(
      (res) => res.data['inflation'],
      onError: (e) => null,
    );
  }

  /// 获取账户信息
  Future<HttpToolResponse?> getAccountChainInfo(String address) {
    return HttpToolClient.getHttp(
            customUri('/cosmos/auth/v1beta1/accounts/$address'))
        .then(
      (res) => res..data = res.data['account'],
      onError: (e) => null,
    );
  }

  /// 获取基础币信息
  Future<TokenModel?> getBaseCoin() {
    return HttpToolClient.getHttp(customUri('token/params')).then((res) {
      return getCoinInfo(res.data?['params']['issue_token_base_fee']['denom'] ??
          localDefaultCoinInfo.minUnit);
    }, onError: (e) => localDefaultCoinInfo);
  }

  /// 获取币种信息
  Future<TokenModel?> getCoinInfo(String denom) {
    return HttpToolClient.getHttp(customUri('token/tokens/$denom'))
        .then<TokenModel?>(
      (res) async {
        var token =
            res.status != 0 ? null : _resFormatToToken(res.data?['Token']);
        var tokenLogo = await httpToolServer.getTokenLogo([denom]);
        token?.logo = tokenLogo.status != 0 ? null : tokenLogo.data[0];
        return token;
      },
      onError: (e) => localDefaultCoinInfo,
    );
  }

  /// 获取账户所有10代币信息
  Future<HttpToolResponse?> getAccountPrc10AllBalance(String address) {
    return HttpToolClient.getHttp(
            customUri('/cosmos/bank/v1beta1/balances/$address'))
        .then(
      (res) => res..data = res.data['balances'],
      onError: (e) => null,
    );
  }

  /// 获取账户币种余额
  Future<HttpToolResponse?> getAccountBalance(String address, String minUnit) {
    if (StringTool.checkChainAddress(minUnit)) {
      return EvmClient.getContractBalance(
              StringTool.bech32ToHex(minUnit), StringTool.bech32ToHex(address))
          .then((res) => HttpToolResponse(res.toString()));
    }
    return HttpToolClient.getHttp(customUri(
        '/cosmos/bank/v1beta1/balances/$address/by_denom',
        queryParameters: {'denom': minUnit})).then(
      (res) =>
          res..data = res.data == null ? null : res.data['balance']['amount'],
      onError: (e) => null,
    );
  }

  // 获取账户发送记录
  Future<HttpToolResponse?> getAccountSenderList(String address,
      {page = 1, limit = 10}) {
    return HttpToolClient.getHttp(customUri('/cosmos/tx/v1beta1/txs',
        query:
            "events=message.module='bank'&events=transfer.sender='$address'&pagination.limit=$limit&pagination.offset=${(page - 1) * limit}&order_by=ORDER_BY_DESC"));
  }

  // 获取账户接收记录
  Future<HttpToolResponse?> getAccountRecipientList(String address,
      {page = 1, limit = 10}) {
    return HttpToolClient.getHttp(customUri('/cosmos/tx/v1beta1/txs',
        query:
            "events=message.module='bank'&events=transfer.recipient='$address'&pagination.limit=$limit&pagination.offset=${(page - 1) * limit}&order_by=ORDER_BY_DESC"));
  }

  // 获取账户发送/接收记录次数
  Future<int> getAccountTransferLength(String address) {
    return Future.wait([
      getAccountRecipientList(address, limit: 1),
      getAccountSenderList(address, limit: 1)
    ])
        .then<int>((res) => (int.parse(res[0]?.data['pagination']['total']) +
            int.parse(res[1]?.data['pagination']['total'])))
        .catchError((e) => 0);
  }

  // 获取线上所有代币列表
  Future<HttpToolResponse> getChainTokensList(int page, {limit = 10}) {
    return HttpToolClient.getHttp(customUri('/token/tokens', queryParameters: {
      'pagination.limit': '$limit',
      'pagination.offset': ((page - 1) * limit).toString(),
      'pagination.count_total': 'true'
    })).then((res) => res
      ..data = ((res.data['Tokens']
              ?.map((_item) => _resFormatToToken(_item))
              .toList()) ??
          []));
  }

  // 获取账户质押中数据
  Future<HttpToolResponse?> getAccountDelegateData(String address) {
    return HttpToolClient.getHttp(customUri(
        '/cosmos/staking/v1beta1/delegations/$address',
        queryParameters: {'pagination.limit': '100000'})).then(
      (res) => res,
      onError: (e) => null,
    );
  }

  // 获取账户赎回中数据
  Future<HttpToolResponse?> getAccountUnDelegateData(String address) {
    return HttpToolClient.getHttp(customUri(
        '/cosmos/staking/v1beta1/delegators/$address/unbonding_delegations',
        queryParameters: {'pagination.limit': '100000'})).then(
      (res) => res,
      onError: (e) => null,
    );
  }

  // 获取账户质押奖励
  Future<HttpToolResponse?> getAccountRewardData(String address,
      {String? vAddress}) {
    return HttpToolClient.getHttp(customUri(
        '/cosmos/distribution/v1beta1/delegators/$address/rewards' +
            (vAddress == null ? '' : '/$vAddress'),
        queryParameters: {'pagination.limit': '100000'})).then(
      (res) => res,
      onError: (e) => null,
    );
  }

  // 获取节点验证者信息
  Future<HttpToolResponse?> getChainVerifierInfo(String vAddress) {
    return HttpToolClient.getHttp(
            customUri('/cosmos/staking/v1beta1/validators/$vAddress'))
        .then(
      (res) => res,
      onError: (e) => null,
    );
  }

  // 获取账户转质押信息
  Future<HttpToolResponse?> getAccountReDelegateData(String address) {
    return HttpToolClient.getHttp(customUri(
            '/cosmos/staking/v1beta1/delegators/$address/redelegations'))
        .then(
      (res) => res,
      onError: (e) => null,
    );
  }

  // 获取所有节点列表
  Future<HttpToolResponse> getChainVerifiersList(int page, {limit = 10}) {
    return HttpToolClient.getHttp(
        customUri('/cosmos/staking/v1beta1/validators', queryParameters: {
      'pagination.limit': '$limit',
      'pagination.offset': ((page - 1) * limit).toString(),
      'pagination.count_total': 'true'
    })).then((res) => res..data = res.data['validators']);
  }

  // 获取所有提案列表
  Future<HttpToolResponse> getChainProposalsList(int page, {limit = 10}) {
    return HttpToolClient.getHttp(
        customUri('/cosmos/gov/v1beta1/proposals', queryParameters: {
      'pagination.limit': '$limit',
      'pagination.offset': ((page - 1) * limit).toString(),
      'pagination.count_total': 'true'
    })).then((res) => res..data = (res.data['proposals']));
  }

  // 获取代币发行数量
  Future<HttpToolResponse> getTokenSupply(String minUnit) {
    return HttpToolClient.getHttp(
            customUri('/cosmos/bank/v1beta1/supply/$minUnit'))
        .then((res) => res..data = (res.data['amount']['amount']));
  }

  // 获取提案详情
  Future<HttpToolResponse> getChainProposalDetail(String id) {
    return HttpToolClient.getHttp(
            customUri('/cosmos/gov/v1beta1/proposals/$id'))
        .then((res) => res..data = (res.data['proposal']));
  }

  // 提案投票总数
  Future<HttpToolResponse> getChainProposalDetailTally(String id) {
    return HttpToolClient.getHttp(
            customUri('/cosmos/gov/v1beta1/proposals/$id/tally'))
        .then((res) => res);
  }

  // 投票发起者
  Future<HttpToolResponse> getChainProposalDetailProposer(String id) {
    return HttpToolClient.getHttp(customUri('/gov/proposals/$id/proposer'))
        .then((res) => res);
  }

  // 提案存款人
  Future<HttpToolResponse> getChainProposalDetailDeposits(String id) {
    return HttpToolClient.getHttp(
            customUri('/cosmos/gov/v1beta1/proposals/$id/deposits'))
        .then((res) => res);
  }

  // 提案投票详情
  Future<HttpToolResponse> getChainProposalDetailVotes(String id, int page,
      {String? type, limit = 10}) {
    var events = [
      'message.action=\'/cosmos.gov.v1beta1.MsgVote\'',
      'proposal_vote.proposal_id=$id',
    ];
    if (type != null) events.add('proposal_vote.option=\'$type\'');
    return HttpToolClient.getHttp(
        customUri('cosmos/tx/v1beta1/txs', queryParameters: {
      'events': events,
      'pagination.limit': '$limit',
      'pagination.offset': '${limit * (page - 1)}'
    })).then((res) => res);
  }

  // 获取代币发行费用
  Future<HttpToolResponse> getChainCreateTokenFee(String symbol) {
    return HttpToolClient.getHttp(customUri('/token/fee/$symbol'))
        .then((res) => res);
  }

  // 获取交易详情
  Future<HttpToolResponse> getChainLogDetail(String hash) {
    return HttpToolClient.getHttp(customUri('/cosmos/tx/v1beta1/txs/$hash'))
        .then((res) => res);
  }
}

_HttpToolApp httpToolApp = _HttpToolApp();

// 26657接口信息
class _HttpToolChain extends UriTool {
  _HttpToolChain() : super(Env.envConfig.urlInfo.chainToolRpcUrl);

  /// 获取链信息
  Future<HttpToolResponse> getChainInfo() {
    return HttpToolClient.getHttp(customUri('/abci_info'))
        .then((res) => res..data = res.data['result']['response']);
  }
}

_HttpToolChain httpToolChain = _HttpToolChain();

// 服务器其他信息
class _HttpToolServer extends UriTool {
  _HttpToolServer() : super(Env.envConfig.urlInfo.backEndSite);

  /// 获取手续费
  Future<HttpToolResponse> getChainFee() {
    return HttpToolClient.getHttp(customUri('rpc/tx_fee'));
  }

  /// 获取公告列表
  Future<HttpToolResponse> getNotificationList(int page, {limit = 10}) {
    return HttpToolClient.getHttp(customUri('news/list',
        queryParameters: {'page': page.toString(), 'limit': limit.toString()}));
  }

  /// 获取公告详情
  Future<HttpToolResponse> getNotificationDetail(String id) {
    return HttpToolClient.getHttp(
        customUri('news/detail', queryParameters: {'id': id}));
  }

  /// 获取代币价值
  Future<HttpToolResponse> getCoinPrice(String coin) {
    return HttpToolClient.getHttp(
        customUri('rpc/coin_price', queryParameters: {'coin': coin}));
  }

  /// 提交问题
  Future<HttpToolResponse> postProblems(FormData data) {
    return HttpToolClient.postHttp(customUri('rpc/desk/submit'), data: data);
  }

  /// dapp列表分类
  Future<HttpToolResponse> getDappTypes() {
    return HttpToolClient.getHttp(customUri('rpc/dapp/type',
        queryParameters: {'page': '1', 'limit': '10000'}));
  }

  /// dapp列表
  Future<HttpToolResponse> getDappList(String type) {
    return HttpToolClient.getHttp(customUri('rpc/dapp',
        queryParameters: {'type': type, 'page': '1', 'limit': '10000'}));
  }

  /// dapp广告图
  Future<HttpToolResponse> getDappAdPic() {
    return HttpToolClient.getHttp(customUri('rpc/swap/image'));
  }

  // 版本号
  Future<HttpToolResponse> getVersion() {
    return HttpToolClient.getHttp(customUri('rpc/swap/image'));
  }

  // 获取账户记录
  Future<HttpToolResponse?> getAccountLogsList(String address, String coin,
      {page = 1, limit = 10}) {
    return HttpToolClient.getHttp(customUri('rpc/new/txs', queryParameters: {
      'page': '$page',
      'limit': '$limit',
      'address': address,
      'coins': coin
    }));
  }

  // 获取节点验证者头像
  Future<HttpToolResponse?> getChainVerifierAvatar(List<String> vAddressList) {
    return HttpToolClient.getHttp(customUri('rpc/validators/avatar',
            query: vAddressList.map((_item) => 'address=$_item').join('&')))
        .then(
      (res) => res,
      onError: (e) => null,
    );
  }

  // 搜索代币信息
  Future<HttpToolResponse> searchTokenInfo(String tokenHand) {
    tokenHand = tokenHand.replaceAll(RegExp(r'\s'), '');
    // 判断hex地址
    if (tokenHand.startsWith('0x') && tokenHand.length == 42) {
      return searchToken20Info(tokenHand);
    }
    // 判断bech32地址
    if (tokenHand.startsWith(Env.envConfig.chainInfo.addressPrefix) &&
        tokenHand.length == 41) {
      return searchToken20Info(StringTool.bech32ToHex(tokenHand));
    }
    // 判断代币名
    return searchToken10Info(tokenHand);
  }

  // 搜索prc10代币信息
  Future<HttpToolResponse> searchToken10Info(String tokenName) {
    return httpToolApp.getCoinInfo(tokenName).then((res) {
      if (res == null) return HttpToolResponse(null);
      return HttpToolResponse({'token': res});
    });
  }

  // 搜索prc20代币信息
  Future<HttpToolResponse> searchToken20Info(String tokenAddress) {
    var _memAddress = tokenAddress;
    if (StringTool.checkChainAddress(tokenAddress)) {
      _memAddress = StringTool.bech32ToHex(tokenAddress);
    }
    return HttpToolClient.getHttp(customUri('rpc/swap/erc20/coin',
        queryParameters: {'contract': _memAddress})).then(
      (res) => res.status != 0
          ? HttpToolResponse(null)
          : HttpToolResponse({
              'token': _resFormatToToken(res.data,
                  contractAddress: StringTool.hexToBech32(_memAddress),
                  type: EnumTokenType.prc20)
            }),
      onError: (e) => null,
    );
  }

  // 获取远程版本号
  Future<HttpToolResponse> getRemoteAppVersion() {
    return HttpToolClient.getHttp(customUri('/v2/version'));
  }

  // 获取代币logo
  Future<HttpToolResponse> getTokenLogo(List tokenList) {
    return HttpToolClient.getHttp(customUri('/rpc/token/logo',
        query: tokenList.map((e) => 'token=$e').join('&')));
  }
}

_HttpToolServer httpToolServer = _HttpToolServer();

// 浏览器其他信息
class _BrowserToolServer extends UriTool {
  _BrowserToolServer() : super(Env.envConfig.urlInfo.browserEndSite);
  // 获取账户所有20代币信息
  Future<HttpToolResponse?> getAccountPrc20AllBalance(String address) {
    return HttpToolClient.getHttp(
        customUri('pvmApi/address/token', queryParameters: {
      'address': address,
      'from': '1',
      'amount': '9999',
    })).then(
      (res) => res..data = res.data?['data']?['List'],
      onError: (e) => null,
    );
  }

  // 获取prc20代币列表
  Future<HttpToolResponse?> getAccountPrc20TokenLogs(
      String address, String contract,
      {page = 1, limit = 10}) {
    return HttpToolClient.getHttp(customUri('pvmApi/address/transferList',
        queryParameters: {
          'from': '$page',
          'amount': '$limit',
          'address': address,
          'token': contract
        })).then(
      (res) => res,
      onError: (e) => null,
    );
  }

  // 获取prc20交易记录详情
  Future<HttpToolResponse?> getPrc20TokenLogDetail(String hex) {
    return HttpToolClient.getHttp(
            customUri('pvmApi/address/transfer', queryParameters: {'hex': hex}))
        .then(
      (res) => res,
      onError: (e) => null,
    );
  }

  // 获取代币单价
  Future<HttpToolResponse?> getTokenPrice(List<String> tokens) {
    return HttpToolClient.getHttp(customUri('pvmApi/price/coins',
        queryParameters: {'tokens': tokens.join(',')})).then(
      (res) => res,
      onError: (e) => null,
    );
  }
}

_BrowserToolServer browserToolServer = _BrowserToolServer();

// 格式化代币数据
TokenModel _resFormatToToken(dynamic _token,
    {EnumTokenType? type, String? contractAddress}) {
  return TokenModel()
    ..symbol = _token['symbol'] ?? ''
    ..name = _token['name'] ?? ''
    ..initialSupply = _token['initial_supply'] ?? ''
    ..maxSupply = _token['max_supply'] ?? ''
    ..minUnit = _token['min_unit'] ?? ''
    ..owner = _token['owner'] ?? ''
    ..scale = _token['scale'] ?? int.tryParse(_token['decimal']) ?? 0
    ..mintable = _token['mintable'] ?? false
    ..type = type ?? EnumTokenType.prc10
    ..contractAddress = contractAddress ?? ''
    ..logo = _token['logo'] ?? '';
}
