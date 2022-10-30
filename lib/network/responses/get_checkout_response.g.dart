// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_checkout_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CheckOutResponse _$CheckOutResponseFromJson(Map<String, dynamic> json) =>
    CheckOutResponse(
      json['code'] as int?,
      json['message'] as String?,
      json['data'] == null
          ? null
          : CheckoutDataVO.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CheckOutResponseToJson(CheckOutResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.checkoutDataVO,
    };
