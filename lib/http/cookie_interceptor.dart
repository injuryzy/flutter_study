import 'dart:io';

import 'package:dio/dio.dart';

class CookieInterceptor extends Interceptor {
  List<String> cookList = [];

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers[HttpHeaders.cookieHeader] = cookList;
    handler.next(options);
    // super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (response.requestOptions.path.contains("user/login")) {
      dynamic list = response.headers[HttpHeaders.setCookieHeader];

      if (list is List) {
        for (String? cookie in list) {
          cookList.add(cookie ?? "");
        }
      }
    }

    super.onResponse(response, handler);
  }
}
