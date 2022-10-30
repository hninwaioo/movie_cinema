// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_payment_type_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentTypeResponse _$PaymentTypeResponseFromJson(Map<String, dynamic> json) =>
    PaymentTypeResponse(
      json['code'] as int?,
      json['message'] as String?,
      (json['data'] as List<dynamic>?)
          ?.map((e) => PaymentVO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PaymentTypeResponseToJson(
        PaymentTypeResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.paymentList,
    };
