// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'credit_cast_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreditCastVO _$CreditCastVOFromJson(Map<String, dynamic> json) => CreditCastVO(
      json['adult'] as bool?,
      json['gender'] as int?,
      json['id'] as int?,
      json['known_for_department'] as String?,
      json['name'] as String?,
      json['original_name'] as String?,
      (json['popularity'] as num?)?.toDouble(),
      json['profile_path'] as String?,
      json['cast_id'] as int?,
      json['character'] as String?,
      json['credit_id'] as String?,
      json['order'] as int?,
      json['department'] as String?,
      json['job'] as String?,
    );

Map<String, dynamic> _$CreditCastVOToJson(CreditCastVO instance) =>
    <String, dynamic>{
      'adult': instance.adult,
      'gender': instance.gender,
      'id': instance.id,
      'known_for_department': instance.known_for_department,
      'name': instance.name,
      'original_name': instance.original_name,
      'popularity': instance.popularity,
      'profile_path': instance.profile_path,
      'cast_id': instance.cast_id,
      'character': instance.character,
      'credit_id': instance.credit_id,
      'order': instance.order,
      'department': instance.department,
      'job': instance.job,
    };
