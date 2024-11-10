// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EventRequest _$EventRequestFromJson(Map<String, dynamic> json) => EventRequest(
      (json['pageSize'] as num).toInt(),
      (json['pageNumber'] as num).toInt(),
      json['sort'] as String?,
      json['asc'] as bool,
    );

Map<String, dynamic> _$EventRequestToJson(EventRequest instance) =>
    <String, dynamic>{
      'pageSize': instance.pageSize,
      'pageNumber': instance.pageNumber,
      'sort': instance.sort,
      'asc': instance.asc,
    };

EventResponse _$EventResponseFromJson(Map<String, dynamic> json) =>
    EventResponse(
      (json['events'] as List<dynamic>)
          .map((e) => Event.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$EventResponseToJson(EventResponse instance) =>
    <String, dynamic>{
      'events': instance.events,
    };

Event _$EventFromJson(Map<String, dynamic> json) => Event(
      DateTime.parse(json['date'] as String),
      json['venue'] as String,
    );

Map<String, dynamic> _$EventToJson(Event instance) => <String, dynamic>{
      'date': instance.date.toIso8601String(),
      'venue': instance.venue,
    };
