import 'package:dio/dio.dart';
import 'package:plug/app/translation/translation.dart';
import 'package:plug/app/ui/components/function/toast.component.dart';

class HttpToolResponse {
  late dynamic data;
  late int status;
  late String message;
  String? path;
  HttpToolResponse(dynamic value, {String? path}) {
    if (value != null) {
      if (value is! Map) {
        data = value;
        status = 0;
        message = 'ok';
      } else if (value['status'] == null) {
        data = value;
        status = 0;
        message = 'ok';
      } else {
        data = value['data'];
        status = value['status'] == 200 ? 0 : value['status'];
        message = value['message'] ?? '';
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
      var language = plugTranslation.nowLocale.value.toLanguageTag();
      var lang = language.split('-')[0];
      response = await Dio().getUri<Map<String, dynamic>>(uri,
          options: Options(headers: {'lang': lang}));
    } catch (e) {
      DioError err = e as DioError;
      if (err.error is String && RegExp(r"404").hasMatch(err.error)) {
        LToast.print('404 + ${uri.toString()}');
      } else {
        LToast.print('${e.message} + ${uri.toString()}');
      }
    }
    if (response != null && response.data != null) {
      return HttpToolResponse(response.data!,
          path: response.requestOptions.path);
    } else {
      return HttpToolResponse(null, path: uri.path);
    }
  }

  static Future<HttpToolResponse> postHttp(Uri uri, {dynamic data}) async {
    Response<Map<String, dynamic>>? response;
    try {
      var language = plugTranslation.nowLocale.value.toLanguageTag();
      var lang = language.split('-')[0];
      response = await Dio().postUri<Map<String, dynamic>>(uri,
          data: data, options: Options(headers: {'lang': lang}));
    } catch (e) {
      DioError err = e as DioError;
      if (err.error is String && RegExp(r"404").hasMatch(err.error)) {
        LToast.print('404');
      } else {
        LToast.print(e.message);
      }
    }
    if (response != null && response.data != null) {
      return HttpToolResponse(response.data!,
          path: response.requestOptions.path);
    } else {
      return HttpToolResponse(null, path: uri.path);
    }
  }
}

class UriTool {
  late Uri _baseUri;
  UriTool(String url) {
    _baseUri = Uri.parse(url);
  }
  Uri _defaultSetUri(
    String path, {
    Map<String, dynamic>? queryParameters,
    String? query,
  }) {
    return Uri(
      scheme: _baseUri.scheme,
      host: _baseUri.host,
      port: _baseUri.port,
      path: '${_baseUri.path}/$path'.replaceAll(RegExp(r'(?!:)//'), '/'),
      query: query,
      queryParameters: queryParameters,
    );
  }

  Uri customUri(
    String path, {
    Map<String, dynamic>? queryParameters,
    String? query,
  }) =>
      _defaultSetUri(path, queryParameters: queryParameters, query: query);
}
