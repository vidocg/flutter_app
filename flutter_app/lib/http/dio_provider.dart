import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/http/auth/auth_api_model.dart';
import 'package:flutter_app/storage/secure_storage.dart';

class DioProvider {
  static Dio? _dio;
  static Dio _initDio() {
    // Dio dio = Dio(BaseOptions(baseUrl: "http://localhost:9993"));

    Dio dio = Dio(BaseOptions(
        baseUrl: "https://f512312b-5c11-472f-8be8-084e2d317564.mock.pstmn.io"));

    dio.interceptors.add(RefreshTokenInterceptor(dio));

    dio.interceptors.add(ErrorResponseInterceptor());
    dio.interceptors.add(TokenHeaderInterceptior());

    _dio = dio;
    return dio;
  }

  static Dio getDio() {
    return _dio ?? _initDio();
  }
}

class ErrorResponseInterceptor extends Interceptor {}

class RefreshTokenInterceptor extends Interceptor {
  final SecureStorage _secureStorage = SecureStorage();
  final Dio dio;

  RefreshTokenInterceptor(this.dio);

  @override
  onError(DioException err, handler) async {
    if (err.response?.statusCode == 401) {
      var refresh = await _secureStorage.getRefresh();
      if (refresh != null) {
        var response =
            await dio.get("/jwt", queryParameters: {"refreshToken": refresh});

        if (response.statusCode != 200) {
          return handler.next(err);
        } else {
          debugPrint("response: ${response.data.toString()}");
          var jsonDecodeResponse = jsonDecode(response.data);
          final parsedResponse = AuthApiResponse.fromJson(jsonDecodeResponse);
          _secureStorage.putJwt(parsedResponse.jwt);
          _secureStorage.putRefresh(parsedResponse.refresh);

          err.requestOptions.headers['Authorization'] =
              'Bearer ${parsedResponse.jwt}';

          return handler.resolve(await dio.fetch(err.requestOptions));
        }
      } else {
        return handler.next(err);
      }
    }
    return handler.next(err);
  }
}

class TokenHeaderInterceptior extends Interceptor {
  final SecureStorage _secureStorage = SecureStorage();

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final String? token = await _secureStorage.getJwt();
    if (token != null) {
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
