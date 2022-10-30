// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_banner_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BannerResponse _$BannerResponseFromJson(Map<String, dynamic> json) =>
    BannerResponse(
      json['code'] as int?,
      json['message'] as String?,
      (json['data'] as List<dynamic>?)
          ?.map((e) => BannerVO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BannerResponseToJson(BannerResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.bannerList,
    };
