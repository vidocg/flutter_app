import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_app/http/dio_provider.dart';
import 'package:flutter_app/http/subscription/subscription_model.dart';

class PlaceholderApiClient {
 
  final Dio dio = DioProvider.getDio();

  PlaceholderApiClient();

  Future<SubscriptionApiResponse> createPost(
      SubscriptionApiRequest request) async {
    final response = await dio.get('/posts');

    if (response.statusCode != 200) {
      // [2]
      throw Exception('Failed to create post ${response.data}');
    }

    final jsonResponse = jsonDecode(response.data);

    return SubscriptionApiResponse.fromJson(jsonResponse);
  }
}
