import 'package:dio/dio.dart';
import 'package:flutter_app/http/dio_provider.dart';
import 'package:flutter_app/http/event_api/event_model.dart';

class EventClient {
  static final EventClient _singleton = EventClient._internal();

  factory EventClient() {
    return _singleton;
  }

  EventClient._internal();
  final Dio _dio = DioProvider.getDio();

  Future<EventResponse> getEvents(EventRequest request) async {
    // final response = await _dio.get('/events', queryParameters: {
    //   if (request.sort != null)
    //     "sort": "${request.sort},${request.asc ? "ASC" : "DESC"}",
    // });

    // if (response.statusCode != 200) {
    //   // [2]
    //   throw Exception('Failed to create post ${response.data}');
    // }

    // final jsonResponse = jsonDecode(response.data);

    // return EventResponse.fromJson(jsonResponse);

    return Future.value(EventResponse("testOne", "testTwo"));
  }
}
