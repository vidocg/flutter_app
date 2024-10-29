import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_app/http/subscription/subscription_model.dart';

class PlaceholderApiClient {
  final String apiUrl;
  final Dio dio = Dio();

  PlaceholderApiClient(this.apiUrl);

  Future<SubscriptionApiResponse> createPost(
      SubscriptionApiRequest request) async {
    final response = await dio.get('$apiUrl/posts');

    if (response.statusCode != 200) {
      // [2]
      throw Exception('Failed to create post ${response.data}');
    }

    final jsonResponse = jsonEncode(response.data);

    return SubscriptionApiResponse.fromJsone(jsonResponse);
  }
}
