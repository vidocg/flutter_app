import 'package:flutter_app/http/model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'event_model.g.dart';

@JsonSerializable()
class EventRequest {
  EventRequest(this.pageSize, this.pageNumber, this.sort, this.asc);
  int pageSize;
  int pageNumber;
  String? sort;
  bool asc;
  factory EventRequest.fromJson(Map<String, dynamic> json) =>
      _$EventRequestFromJson(json);

  Map<String, dynamic> toJson() => _$EventRequestToJson(this);
}

@JsonSerializable()
class EventResponse {
  EventResponse(this.events, this.page);
  List<Event> events;
  CustomPage page;

  factory EventResponse.fromJson(Map<String, dynamic> json) =>
      _$EventResponseFromJson(json);

  Map<String, dynamic> toJson() => _$EventResponseToJson(this);
}

@JsonSerializable()
class Event {
  Event(this.date, this.venue);
  DateTime date;
  String venue;

  factory Event.fromJson(Map<String, dynamic> json) => _$EventFromJson(json);

  Map<String, dynamic> toJson() => _$EventToJson(this);
}
