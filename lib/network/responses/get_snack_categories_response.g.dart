// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_snack_categories_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SnackCategoriesResponse _$SnackCategoriesResponseFromJson(
        Map<String, dynamic> json) =>
    SnackCategoriesResponse(
      json['code'] as int?,
      json['message'] as String?,
      (json['data'] as List<dynamic>?)
          ?.map((e) => SnackCategoriesVO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SnackCategoriesResponseToJson(
        SnackCategoriesResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.snackCategoriesList,
    };
