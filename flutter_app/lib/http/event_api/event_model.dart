import 'package:json_annotation/json_annotation.dart';

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
  EventResponse(this.valOne, this.valTwo);
  String valOne;
  String valTwo;

  factory EventResponse.fromJson(Map<String, dynamic> json) =>
      _$EventResponseFromJson(json);

  Map<String, dynamic> toJson() => _$EventResponseToJson(this);
}
