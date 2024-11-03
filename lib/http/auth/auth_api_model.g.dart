// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthApiRequest _$AuthApiRequestFromJson(Map<String, dynamic> json) =>
    AuthApiRequest(
      json['Password'] as String,
      json['Email'] as String,
    );

Map<String, dynamic> _$AuthApiRequestToJson(AuthApiRequest instance) =>
    <String, dynamic>{
      'Password': instance.password,
      'Email': instance.email,
    };

AuthApiResponse _$AuthApiResponseFromJson(Map<String, dynamic> json) =>
    AuthApiResponse(
      json['Jwt'] as String,
      json['Refresh'] as String,
    );

Map<String, dynamic> _$AuthApiResponseToJson(AuthApiResponse instance) =>
    <String, dynamic>{
      'Refresh': instance.refresh,
      'Jwt': instance.jwt,
    };
