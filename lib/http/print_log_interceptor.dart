import 'dart:developer';

import 'package:dio/dio.dart';

class PrintLogInterceptor extends InterceptorsWrapper {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    log("---------request-------------\n");
    log("---------${options.uri}--------- \n");
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    log("---------response-------------\n");
    log("---------${response.data}-------------\n");
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    log("---------onError-------------\n");
    log("---------${err.error}-------------\n");
    super.onError(err, handler);
  }
}
