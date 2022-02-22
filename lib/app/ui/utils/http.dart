import 'package:dio/dio.dart';
import 'package:plug/app/config/config.chain.dart';
import 'package:plug/app/data/models/interface/interface.dart';
import 'package:plug/app/ui/components/function/toast.component.dart';

class HttpToolResponse {
  late dynamic data;
  late int status;
  late String message;
  String? path;
  HttpToolResponse (
    Map<String, dynamic>? value,
    {
      String? path
    }
  ) {
    if (value != null) {
      if (value['status'] == null) {
        data = value;
        status = 0;
        message = 'ok';
      } else {
        data = value['data'];
        status = value['status'] == 200 ? 0 : value['status'];
        message = value['message']??'';
      }
    } else {
      data = null;
      status = -10002;
      message = 'error';
    }
    path = path;
  }
  @override
  toString() {
    return '{  status:$status,  message: $message,  data: $data,  path: $path,}';
  }
}

class HttpToolClient {
  static Future<HttpToolResponse> getHttp(Uri uri) async {
    Response<Map<String, dynamic>>? response;
    try {
      var language = ConfigChainData.localLanguage;
      response = await Dio().getUri<Map<String, dynamic>>(uri, options: Options(headers: { 'lang': language}));
    } catch (e) {
      DioError err = e as DioError;
      if (err.error is String && RegExp(r"404").hasMatch(err.error)) {
        LToast.print('404 + ${uri.toString()}');
      } else {
        LToast.print('${e.message} + ${uri.toString()}');
      }
    }
    if (response != null && response.data != null) {
      return HttpToolResponse(response.data!, path: response.requestOptions.path);
    } else {
      return HttpToolResponse(null, path: uri.path);
    }
  }
  static Future<HttpToolResponse> postHttp(Uri uri, { dynamic data }) async {
    Response<Map<String, dynamic>>? response;
    try {
      var language = ConfigChainData.localLanguage;
      response = await Dio().postUri<Map<String, dynamic>>(uri, data: data, options: Options(headers: { 'lang': language}));
    } catch (e) {
      DioError err = e as DioError;
      if (err.error is String && RegExp(r"404").hasMatch(err.error)) {
        LToast.print('404');
      } else {
        LToast.print(e.message);
      }
    }
    if (response != null && response.data != null) {
      return HttpToolResponse(response.data!, path: response.requestOptions.path);
    } else {
      return HttpToolResponse(null, path: uri.path);
    }
  }
}

class UriTool {
  late Uri _baseUri;
  UriTool(
    String url
  ) {
    _baseUri = Uri.parse(url);
  }
  Uri _defaultSetUri(
    String path,
    {
      Map<String, dynamic>? queryParameters,
      String? query,
    }
  ) {
    return Uri(
      scheme: _baseUri.scheme,
      host: _baseUri.host,
      port: _baseUri.port,
      path: '${_baseUri.path}/$path',
      query: query,
      queryParameters: queryParameters,
    );
  }
  
  Uri customUri (String path, {Map<String, dynamic>? queryParameters}) => _defaultSetUri(path, queryParameters: queryParameters);
}

// 1317接口信息
class _HttpToolApp extends UriTool {
  _HttpToolApp() : super(ConfigChainData.appInfoRpcUrl);
  /// 获取账户信息
  Future<HttpToolResponse?> getAccountChainInfo(String address) {
    return HttpToolClient.getHttp(_defaultSetUri('/cosmos/auth/v1beta1/accounts/$address'))
      .then(
        (res) => res..data = res.data['account'],
        onError: (e) => null,
      );
  }
  /// 获取基础币信息
  Future<TokenModel?> getBaseCoin() {
    return HttpToolClient.getHttp(_defaultSetUri('token/params'))
      .then(
        (res) => getCoinInfo(res.data['params']['issue_token_base_fee']['denom']),
        onError: (e) => null
      );
  }
  /// 获取币种信息
  Future<TokenModel?> getCoinInfo(String denom) {
    return HttpToolClient.getHttp(_defaultSetUri('token/tokens/$denom'))
      .then<TokenModel?>(
        (res) => _resFormatToToken(res.data['Token']),
        onError: (e) => null,
      );
  }
  /// 获取账户所有代币信息
  Future<HttpToolResponse?> getAccountAllBalance(String address) {
    return HttpToolClient.getHttp(_defaultSetUri('/cosmos/bank/v1beta1/balances/$address'))
      .then(
        (res) => res..data = res.data['balances'],
        onError: (e) => null,
      );
  }
  /// 获取账户币种余额
  Future<HttpToolResponse?> getAccountBalance(String address, String minUnit) {
    return HttpToolClient.getHttp(_defaultSetUri('/cosmos/bank/v1beta1/balances/$address/$minUnit'))
      .then(
        (res) => res..data = res.data == null ? null : res.data['balance']['amount'],
        onError: (e) => null,
      );
  }
  // 获取账户发送记录
  Future<HttpToolResponse?> getAccountSenderList(String address, { page = 1, limit = 10 }) {
    return HttpToolClient.getHttp(
      _defaultSetUri('/cosmos/tx/v1beta1/txs', query: "events=message.module='bank'&events=transfer.sender='$address'&pagination.limit=$limit&pagination.offset=${(page - 1) * limit}&order_by=ORDER_BY_DESC")
    );
  }
  // 获取账户接收记录
  Future<HttpToolResponse?> getAccountRecipientList(String address, { page = 1, limit = 10 }) {
    return HttpToolClient.getHttp(
      _defaultSetUri('/cosmos/tx/v1beta1/txs', query: "events=message.module='bank'&events=transfer.recipient='$address'&pagination.limit=$limit&pagination.offset=${(page - 1) * limit}&order_by=ORDER_BY_DESC")
    );
  }
  // 获取账户发送/接收记录次数
  Future<int> getAccountTransferLength (String address) {
    return Future.wait([getAccountRecipientList(address, limit: 1), getAccountSenderList(address, limit: 1)])
      .then<int>((res) => (int.parse(res[0]?.data['pagination']['total']) + int.parse(res[1]?.data['pagination']['total'])))
      .catchError((e) => 0);
  }
  // 获取线上所有代币列表
  Future<HttpToolResponse> getChainTokensList(int page, { limit = 10 }) {
    return HttpToolClient.getHttp(
      _defaultSetUri('/token/tokens', queryParameters: { 'pagination.limit': '$limit', 'pagination.offset': ((page - 1) * limit).toString(), 'pagination.count_total': 'true' })
    ).then((res) => res..data = ((res.data['Tokens']?.map((_item) => _resFormatToToken(_item)).toList())??[]));
  }
  // 获取账户质押中数据
  Future<HttpToolResponse?> getAccountDelegateData(String address) {
    return HttpToolClient.getHttp(_defaultSetUri('/cosmos/staking/v1beta1/delegations/$address', queryParameters: { 'pagination.limit': '100000'}))
      .then(
        (res) => res,
        onError: (e) => null,
      );
  }
  // 获取账户赎回中数据
  Future<HttpToolResponse?> getAccountUnDelegateData(String address) {
    return HttpToolClient.getHttp(_defaultSetUri('/cosmos/staking/v1beta1/delegators/$address/unbonding_delegations', queryParameters: { 'pagination.limit': '100000'}))
      .then(
        (res) => res,
        onError: (e) => null,
      );
  }
  // 获取账户质押奖励
  Future<HttpToolResponse?> getAccountRewardData(String address, { String? vAddress }) {
    return HttpToolClient.getHttp(_defaultSetUri('/cosmos/distribution/v1beta1/delegators/$address/rewards' + (vAddress == null ? '' : '/$vAddress'), queryParameters: { 'pagination.limit': '100000'}))
      .then(
        (res) => res,
        onError: (e) => null,
      );
  }
  // 获取节点验证者信息
  Future<HttpToolResponse?> getChainVerifierInfo(String vAddress) {
    return HttpToolClient.getHttp(_defaultSetUri('/cosmos/staking/v1beta1/validators/$vAddress'))
      .then(
        (res) => res,
        onError: (e) => null,
      );
  }
  // 获取账户转质押信息
  Future<HttpToolResponse?> getAccountReDelegateData(String address) {
    return HttpToolClient.getHttp(_defaultSetUri('/cosmos/staking/v1beta1/delegators/$address/redelegations'))
      .then(
        (res) => res,
        onError: (e) => null,
      );
  }
  // 获取所有节点列表
  Future<HttpToolResponse> getChainVerifiersList(int page, { limit = 10 }) {
    return HttpToolClient.getHttp(
      _defaultSetUri('/cosmos/staking/v1beta1/validators', queryParameters: { 'pagination.limit': '$limit', 'pagination.offset': ((page - 1) * limit).toString(), 'pagination.count_total': 'true' })
    ).then((res) => res..data = res.data['validators']);
  }
  // 获取所有提案列表
  Future<HttpToolResponse> getChainProposalsList(int page, { limit = 10 }) {
    return HttpToolClient.getHttp(
      _defaultSetUri('/cosmos/gov/v1beta1/proposals', queryParameters: { 'pagination.limit': '$limit', 'pagination.offset': ((page - 1) * limit).toString(), 'pagination.count_total': 'true' })
    ).then((res) => res..data = (res.data['proposals']));
  }
  // 获取代币发行数量
  Future<HttpToolResponse> getTokenSupply(String minUnit) {
    return HttpToolClient.getHttp(
      _defaultSetUri('/cosmos/bank/v1beta1/supply/$minUnit')
    ).then((res) => res..data = (res.data['amount']['amount']));
  }
  // 获取提案详情
  Future<HttpToolResponse> getChainProposalDetail(String id) {
    return HttpToolClient.getHttp(
      _defaultSetUri('/cosmos/gov/v1beta1/proposals/$id')
    ).then((res) => res..data = (res.data['proposal']));
  }
  // 提案投票总数
  Future<HttpToolResponse> getChainProposalDetailTally(String id) {
    return HttpToolClient.getHttp(
      _defaultSetUri('/cosmos/gov/v1beta1/proposals/$id/tally')
    ).then((res) => res);
  }
  // 投票发起者
  Future<HttpToolResponse> getChainProposalDetailProposer(String id) {
    return HttpToolClient.getHttp(
      _defaultSetUri('/gov/proposals/$id/proposer')
    ).then((res) => res);
  }
  // 提案存款人
  Future<HttpToolResponse> getChainProposalDetailDeposits(String id) {
    return HttpToolClient.getHttp(
      _defaultSetUri('/cosmos/gov/v1beta1/proposals/$id/deposits')
    ).then((res) => res);
  }
  // 提案投票详情
  Future<HttpToolResponse> getChainProposalDetailVotes(String id, int page, { String? type, limit = 10 }) {
    var events = [
      'message.action=\'vote\'',
      'proposal_vote.proposal_id=$id',
    ];
    if (type != null) events.add('proposal_vote.option=\'$type\'');
    return HttpToolClient.getHttp(
      _defaultSetUri('cosmos/tx/v1beta1/txs', queryParameters: {
        'events': events,
        'pagination.limit': '$limit',
        'pagination.offset': '${limit * (page - 1)}'
      })
    ).then((res) => res);
  }
  // 获取代币发行费用
  Future<HttpToolResponse> getChainCreateTokenFee(String symbol) {
    return HttpToolClient.getHttp(
      _defaultSetUri('/token/fee/$symbol')
    ).then((res) => res);
  }

  // 获取账户质押列表
  TokenModel _resFormatToToken(dynamic _token) {
    return TokenModel()
      ..symbol = _token['symbol']
      ..name = _token['name']
      ..initialSupply = _token['initial_supply']
      ..maxSupply = _token['max_supply']
      ..minUnit = _token['min_unit']
      ..owner = _token['owner']
      ..scale = _token['scale']
      ..mintable = _token['mintable'];
  }
}
_HttpToolApp httpToolApp = _HttpToolApp();
// 26657接口信息
class _HttpToolChain extends UriTool {
  _HttpToolChain() : super(ConfigChainData.chainInfoRpcUrl);
  /// 获取链信息
  Future<HttpToolResponse> getChainInfo() {
    return HttpToolClient.getHttp(
      _defaultSetUri('/abci_info')
    ).then((res) => res..data = res.data['result']['response']);
  }
}
_HttpToolChain httpToolChain = _HttpToolChain();
// 其他信息
class _HttpToolServer extends UriTool {
  _HttpToolServer() : super(ConfigChainData.serverInfoRpcUrl);
  /// 获取手续费
  Future<HttpToolResponse> getChainFee() {
    return HttpToolClient.getHttp(
      _defaultSetUri('/rpc/tx_fee')
    );
  }
}
_HttpToolServer httpToolServer = _HttpToolServer();