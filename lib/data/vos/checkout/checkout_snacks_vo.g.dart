// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'checkout_snacks_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CheckoutSnacksVO _$CheckoutSnacksVOFromJson(Map<String, dynamic> json) =>
    CheckoutSnacksVO(
      json['id'] as int?,
      json['name'] as String?,
      json['description'] as String?,
      json['image'] as String?,
      json['price'] as int?,
      json['unit_price'] as int?,
      json['quantity'] as int?,
      json['total_price'] as int?,
    );

Map<String, dynamic> _$CheckoutSnacksVOToJson(CheckoutSnacksVO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'image': instance.image,
      'price': instance.price,
      'unit_price': instance.unitPrice,
      'quantity': instance.quantity,
      'total_price': instance.totalPrice,
    };
