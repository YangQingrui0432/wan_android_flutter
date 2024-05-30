import 'dart:io';

import 'package:dio/dio.dart';
import 'package:wan_android_flutter/utils/sp_utils.dart';

import '../constants.dart';

class CookieInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    SPUtils.getStringList(Constants.KEY_COOKIES).then((value) {
      options.headers[HttpHeaders.cookieHeader] = value;
      handler.next(options);
    });
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (response.requestOptions.path.contains("/user/login") ||
        response.requestOptions.path.contains("/user/register") ||
        response.requestOptions.path.contains("/user/logout/json")) {
      dynamic list = response.headers[HttpHeaders.setCookieHeader];
      List<String> cookies = [];
      if (list is List) {
        for (var e in list) {
          cookies.add(e);
        }
      }
      SPUtils.saveStringList(Constants.KEY_COOKIES, cookies);
    }

    super.onResponse(response, handler);
  }
}
