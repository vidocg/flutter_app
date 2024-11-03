import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_app/storage/secure_storage.dart';

class DioProvider {
  static Dio? _dio;
  static Dio _initDio() {
    // Dio dio = Dio(BaseOptions(baseUrl: "http://localhost:9993"));

    Dio dio = Dio(BaseOptions(
        baseUrl: "https://f512312b-5c11-472f-8be8-084e2d317564.mock.pstmn.io"));

    dio.interceptors.add(ErrorResponseInterceptor());

    _dio = dio;
    return dio;
  }

  static Dio getDio() {
    return _dio ?? _initDio();
  }
}

class ErrorResponseInterceptor extends Interceptor {}

class TokenHeaderInterceptior extends Interceptor {
  final SecureStorage _secureStorage = SecureStorage();

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final String? token = _secureStorage.getJwt();
    if (token != null) {
      log('data $token');
      options.headers.addAll({
        "Authorization": "Bearer $token",
      });
    }

    options.headers.addAll({
      "Content-Type": "application/json",
    });

    return super.onRequest(options, handler);
  }
}
