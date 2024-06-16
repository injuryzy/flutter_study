import 'package:client_app/http/http_method.dart';
import 'package:client_app/http/print_log_interceptor.dart';
import 'package:client_app/http/resp_insterceptor.dart';
import 'package:dio/dio.dart';

class DioInstance {
  static DioInstance? _instance;

  DioInstance._();

  static DioInstance instance() {
    return _instance ??= DioInstance._();
  }

  final Dio _dio = Dio();

  final _defaultTime = const Duration(seconds: 30);

  void initDio({
    required String baseUrl,
    String? httpMethod = HttpMethod.GET,
    Duration? connectTimeout,
    Duration? receiveTimeout,
    Duration? sendTimeout,
    ResponseType? responseType = ResponseType.json,
    String? contentType,
  }) {
    _dio.options = BaseOptions(
      method: httpMethod,
      baseUrl: baseUrl,
      connectTimeout: connectTimeout ?? _defaultTime,
      receiveTimeout: receiveTimeout ?? _defaultTime,
      sendTimeout: sendTimeout ?? _defaultTime,
    );
    //  打印拦截
    _dio.interceptors.add(PrintLogInterceptor());
    //  拦截处理
    _dio.interceptors.add(ResponseInterceptor());
  }

  // get 请求
  Future<Response> get(
      {required String path,
      Map<String, dynamic>? param,
      Options? options,
      CancelToken? cancelToken}) async {
    return await _dio.get(path,
        queryParameters: param,
        options: options ??
            Options(
                method: HttpMethod.GET,
                receiveTimeout: _defaultTime,
                sendTimeout: _defaultTime),
        cancelToken: cancelToken);
  }

  Future<Response> post(
      {required String path,
      Object? data,
      Map<String, dynamic>? queryParameters,
      Options? option,
      CancelToken? cancelToken}) async {
    return await _dio.post(path,
        queryParameters: queryParameters,
        data: data,
        cancelToken: cancelToken,
        options: option ??
            Options(
                method: HttpMethod.POST,
                receiveTimeout: _defaultTime,
                sendTimeout: _defaultTime));
  }
}
