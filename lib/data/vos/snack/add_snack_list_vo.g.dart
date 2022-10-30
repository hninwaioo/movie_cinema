// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_snack_list_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddSnackListVO _$AddSnackListVOFromJson(Map<String, dynamic> json) =>
    AddSnackListVO(
      id: json['id'] as int,
      quantity: json['quantity'] as int,
      snackName: json['snackName'] as String,
      totalPrice: json['totalPrice'] as int,
    );

Map<String, dynamic> _$AddSnackListVOToJson(AddSnackListVO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'quantity': instance.quantity,
      'snackName': instance.snackName,
      'totalPrice': instance.totalPrice,
    };
