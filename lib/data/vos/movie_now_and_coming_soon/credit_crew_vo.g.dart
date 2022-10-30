// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'credit_crew_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreditCrewVO _$CreditCrewVOFromJson(Map<String, dynamic> json) => CreditCrewVO(
      json['adult'] as bool?,
      json['gender'] as int?,
      json['id'] as int?,
      json['known_for_department'] as String?,
      json['name'] as String?,
      json['original_name'] as String?,
      (json['popularity'] as num?)?.toDouble(),
      json['profile_path'] as String?,
      json['credit_id'] as String?,
      json['department'] as String?,
      json['job'] as String?,
    );

Map<String, dynamic> _$CreditCrewVOToJson(CreditCrewVO instance) =>
    <String, dynamic>{
      'adult': instance.adult,
      'gender': instance.gender,
      'id': instance.id,
      'known_for_department': instance.known_for_department,
      'name': instance.name,
      'original_name': instance.original_name,
      'popularity': instance.popularity,
      'profile_path': instance.profile_path,
      'credit_id': instance.credit_id,
      'department': instance.department,
      'job': instance.job,
    };
