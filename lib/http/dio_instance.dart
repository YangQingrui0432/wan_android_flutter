import 'package:dio/dio.dart';
import 'package:wan_android_flutter/http/http_method.dart';
import 'package:wan_android_flutter/http/print_log_interceptor.dart';
import 'package:wan_android_flutter/http/rsp_interceptor.dart';

import 'cookie_interceptor.dart';

class DioInstance {
  static final DioInstance _instance = DioInstance._internal();

  static const _defaultTimeout = Duration(seconds: 30);

  final _dio = Dio();

  DioInstance._internal();

  factory DioInstance() {
    return _instance;
  }

  Future<void> init(
    String baseUrl, {
    String method = HttpMethod.GET,
    Duration? connectTimeout = _defaultTimeout,
    Duration? receiveTimeout = _defaultTimeout,
    Duration? sendTimeout = _defaultTimeout,
  }) async {
    _dio.options = BaseOptions(
        baseUrl: baseUrl,
        method: method,
        connectTimeout: connectTimeout,
        receiveTimeout: receiveTimeout,
        sendTimeout: sendTimeout);
    _dio.interceptors.add(CookieInterceptor());
    _dio.interceptors.add(PrintLogInterceptor());
    _dio.interceptors.add(ResponseInterceptor());
  }

  Future<Response> get(String path,
      {Object? data,
      Map<String, dynamic>? queryParameters,
      Options? options,
      CancelToken? cancelToken}) async {
    return _dio.get(path,
        data: data,
        queryParameters: queryParameters,
        options: options ??
            Options(
                method: HttpMethod.GET,
                sendTimeout: _defaultTimeout,
                receiveTimeout: _defaultTimeout),
        cancelToken: cancelToken);
  }

  Future<Response> post(String path,
      {Object? data,
      Map<String, dynamic>? queryParameters,
      Options? options,
      CancelToken? cancelToken}) async {
    return _dio.post(path,
        data: data,
        queryParameters: queryParameters,
        options: options ??
            Options(
                method: HttpMethod.POST,
                sendTimeout: _defaultTimeout,
                receiveTimeout: _defaultTimeout),
        cancelToken: cancelToken);
  }
}
