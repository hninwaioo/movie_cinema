import 'package:json_annotation/json_annotation.dart';

import '../../data/vos/payment_vo.dart';
part 'get_payment_type_response.g.dart';

@JsonSerializable()
class PaymentTypeResponse{

  @JsonKey(name: "code")
  int? code;

  @JsonKey(name:"message")
  String? message;

  @JsonKey(name: "data")
  List<PaymentVO>? paymentList;

  PaymentTypeResponse(this.code, this.message, this.paymentList);

  factory PaymentTypeResponse.fromJson(Map<String,dynamic> json) => _$PaymentTypeResponseFromJson(json);

  Map<String,dynamic> toJson() => _$PaymentTypeResponseToJson(this);

}