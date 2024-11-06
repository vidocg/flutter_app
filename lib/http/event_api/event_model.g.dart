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
      json['valOne'] as String,
      json['valTwo'] as String,
    );

Map<String, dynamic> _$EventResponseToJson(EventResponse instance) =>
    <String, dynamic>{
      'valOne': instance.valOne,
      'valTwo': instance.valTwo,
    };
