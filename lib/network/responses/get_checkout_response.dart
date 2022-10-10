import 'package:json_annotation/json_annotation.dart';
import 'package:movie_cinema/data/vos/checkout/checkout_data_vo.dart';
part 'get_checkout_response.g.dart';

@JsonSerializable()
class CheckOutResponse {

  @JsonKey(name: "code")
  int? code;

  @JsonKey(name: "message")
  String? message;

  @JsonKey(name: "data")
  CheckoutDataVO? checkoutDataVO;

  CheckOutResponse(this.code, this.message, this.checkoutDataVO);

  factory CheckOutResponse.fromJson(Map<String,dynamic> json) => _$CheckOutResponseFromJson(json);

  Map<String,dynamic> toJson() => _$CheckOutResponseToJson(this);
}