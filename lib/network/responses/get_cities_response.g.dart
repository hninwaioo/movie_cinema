// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_cities_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CitiesResponse _$CitiesResponseFromJson(Map<String, dynamic> json) =>
    CitiesResponse(
      json['code'] as int?,
      json['message'] as String?,
      (json['data'] as List<dynamic>?)
          ?.map((e) => CitiesVO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CitiesResponseToJson(CitiesResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.citiesList,
    };
