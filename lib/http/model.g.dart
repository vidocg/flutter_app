// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CustomPage _$CustomPageFromJson(Map<String, dynamic> json) => CustomPage(
      (json['pageSize'] as num).toInt(),
      (json['itemsNum'] as num).toInt(),
      (json['currentPageNum'] as num).toInt(),
    );

Map<String, dynamic> _$CustomPageToJson(CustomPage instance) =>
    <String, dynamic>{
      'pageSize': instance.pageSize,
      'itemsNum': instance.itemsNum,
      'currentPageNum': instance.currentPageNum,
    };
