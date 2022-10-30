// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_otp_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OTPResponse _$OTPResponseFromJson(Map<String, dynamic> json) => OTPResponse(
      json['code'] as int?,
      json['message'] as String?,
    );

Map<String, dynamic> _$OTPResponseToJson(OTPResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
    };
