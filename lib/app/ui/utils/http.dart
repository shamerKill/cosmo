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
        status = value['status']??200;
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
        LToast.log('404');
      } else {
        LToast.log(e.message);
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
        LToast.log('404');
      } else {
        LToast.log(e.message);
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
    }
  ) {
    return Uri(
      scheme: _baseUri.scheme,
      host: _baseUri.host,
      port: _baseUri.port,
      path: '${_baseUri.path}/$path',
      queryParameters: queryParameters,
    );
  }
  
  Uri customUri (String path, {Map<String, dynamic>? queryParameters}) => _defaultSetUri(path, queryParameters: queryParameters);
}

// 1317接口信息
class _HttpToolApp extends UriTool {
  _HttpToolApp() : super(ConfigChainData.appInfoRpcUrl);
  /// 获取基础币信息
  getBaseCoin() {
    HttpToolClient.getHttp(_defaultSetUri('token/params'))
      .then((res) => getCoinInfo(res.data['params']['issue_token_base_fee']['denom']), onError: (e) => null);
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
        (res) => res..data = res.data['balance']['amount'],
        onError: (e) => null,
      );
  }
  // 获取账户发送记录
  Future<HttpToolResponse?> getAccountSenderList(String address) {
    return HttpToolClient.getHttp(
      // ignore: equal_keys_in_map
      _defaultSetUri('/cosmos/tx/v1beta1/txs', queryParameters: { 'events': "message.module='bank'", 'events': "transfer.sender='$address'", 'limit': '1' })
    );
  }
  // 获取账户接收记录
  Future<HttpToolResponse?> getAccountRecipientList(String address) {
    return HttpToolClient.getHttp(
      // ignore: equal_keys_in_map
      _defaultSetUri('/cosmos/tx/v1beta1/txs', queryParameters: { 'events': "message.module='bank'", 'events': "transfer.recipient='$address'", 'limit': '1' })
    );
  }
  // 获取账户发送/接收记录次数
  Future<int> getAccountTransferLength (String address) {
    return Future.wait([getAccountRecipientList(address), getAccountSenderList(address)])
      .then<int>((res) => (int.parse(res[0]?.data['pagination']['total']) + int.parse(res[1]?.data['pagination']['total'])))
      .catchError((e) => 0);
  }
  // 获取线上所有代币列表
  Future<HttpToolResponse> getChainTokensList(int page, { limit = 10 }) {
    return HttpToolClient.getHttp(
      _defaultSetUri('/token/tokens', queryParameters: { 'pagination.limit': '$limit', 'pagination.offset': ((page - 1) * limit).toString(), 'pagination.count_total': 'true' })
    ).then((res) => res..data = ((res.data['Tokens']?.map((_item) => _resFormatToToken(_item)).toList())??[]));
  }
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
  getChainInfo() {
  }
}
_HttpToolChain httpToolChain = _HttpToolChain();
// 其他信息