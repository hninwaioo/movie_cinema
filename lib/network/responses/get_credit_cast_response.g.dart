// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_credit_cast_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreditCastResponse _$CreditCastResponseFromJson(Map<String, dynamic> json) =>
    CreditCastResponse(
      json['id'] as int?,
      (json['cast'] as List<dynamic>?)
          ?.map((e) => CreditCastVO.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['crew'] as List<dynamic>?)
          ?.map((e) => CreditCrewVO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CreditCastResponseToJson(CreditCastResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'cast': instance.castList,
      'crew': instance.crewList,
    };
