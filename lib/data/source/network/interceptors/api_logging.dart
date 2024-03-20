import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import 'package:github_test/data/source/network/constants/api_constants.dart';

class ApiLogging extends Interceptor {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    options.headers[HeaderParameterKeys.accept] = HeaderValues.applicationJson;

    debugPrint(
        'REQUEST[${options.method}] => PATH: ${options.uri} => HEADER: ${options.headers}  => BODY: ${options.data} => QUERY: ${options.queryParameters}');
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    debugPrint(
      'RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path} => DATA: ${response.data}',
    );
    return super.onResponse(response, handler);
  }

  @override
  Future<void> onError(
      DioException err, ErrorInterceptorHandler handler) async {
    debugPrint(
      'ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path} => MESSAGE: ${err.message} => DATA: ${err.response?.data}',
    );
    if (err.response?.statusCode == 401) {}
    return super.onError(err, handler);
  }
}
