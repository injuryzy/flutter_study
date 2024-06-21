import 'package:client_app/http/base_model.dart';
import 'package:dio/dio.dart';
import 'package:oktoast/oktoast.dart';

class ResponseInterceptor extends Interceptor {
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (response.statusCode == 200) {
      try {
        var resp = BaseModel.formJson(response.data);
        if (resp.errorCode == 0) {
          if (resp.data == null) {
            handler.next(
                Response(requestOptions: response.requestOptions, data: true));
          } else {
            handler.next(Response(
                requestOptions: response.requestOptions, data: resp.data));
          }
        } else if (resp.errorCode == -1001) {
          handler.reject(DioException(
              requestOptions: response.requestOptions, message: "未登录"));
          showToast("请先登录");
        } else {
          handler.next(Response(
              requestOptions: response.requestOptions, data: resp.errorMsg));
        }
      } catch (e) {
        handler.reject(DioException(
            requestOptions: response.requestOptions, message: "$e"));
      }
    } else {
      handler.reject(DioException(requestOptions: response.requestOptions));
    }
  }
}
