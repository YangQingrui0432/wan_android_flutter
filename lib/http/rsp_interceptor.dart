import 'package:dio/dio.dart';
import 'package:wan_android_flutter/http/base_model.dart';

class ResponseInterceptor extends Interceptor {
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (response.statusCode == 200) {
      var rsp = BaseModel.fromJson(response.data);
      try {
        if (rsp.errorCode == 0) {
          if (rsp.data == null) {
            handler.next(
                Response(requestOptions: response.requestOptions, data: true));
          } else {
            handler.next(Response(
                requestOptions: response.requestOptions, data: rsp.data));
          }
        } else if (rsp.errorCode == -1) {
          handler.reject(DioException(
              requestOptions: response.requestOptions, message: rsp.errorMsg));
        } else if (rsp.errorCode == -1001) {
          handler.reject(DioException(
              requestOptions: response.requestOptions, message: "未登录"));
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
