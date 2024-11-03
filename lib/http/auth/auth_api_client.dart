import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_app/http/auth/auth_api_model.dart';
import 'package:flutter_app/http/dio_provider.dart';
import 'package:flutter_app/storage/secure_storage.dart';

class AuthApiClient {
  static final AuthApiClient _singleton = AuthApiClient._internal();
  SecureStorage secureStorage = SecureStorage();

  factory AuthApiClient() {
    return _singleton;
  }

  AuthApiClient._internal();

  final Dio _dio = DioProvider.getDio();

  Future<AuthApiResponse> login(AuthApiRequest request) async {
    final response = await _dio.post('/token', data: request.toJson());

    if (response.statusCode != 200) {
      // [2]
      throw Exception('Failed to create post ${response.data.toString()}');
    }

    debugPrint("response: ${response.data.toString()}");
    var jsonDecodeResponse = jsonDecode(response.data);
    final parsedResponse = AuthApiResponse.fromJson(jsonDecodeResponse);
    secureStorage.putJwt(parsedResponse.jwt);

    return parsedResponse;
  }
}
