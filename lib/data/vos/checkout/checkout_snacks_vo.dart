import 'package:json_annotation/json_annotation.dart';
part 'checkout_snacks_vo.g.dart';

@JsonSerializable()
class CheckoutSnacksVO {
  @JsonKey(name: "id")
  int? id;

  @JsonKey(name: "name")
  String? name;

  @JsonKey(name: "description")
  String? description;

  @JsonKey(name: "image")
  String? image;

  @JsonKey(name: "price")
  int? price;

  @JsonKey(name: "unit_price")
  int? unitPrice;

  @JsonKey(name: "quantity")
  int? quantity;

  @JsonKey(name: "total_price")
  int? totalPrice;

  CheckoutSnacksVO(this.id, this.name, this.description, this.image, this.price,
      this.unitPrice, this.quantity, this.totalPrice);

  factory CheckoutSnacksVO.fromJson(Map<String,dynamic> json) => _$CheckoutSnacksVOFromJson(json);

  Map<String,dynamic> toJson() => _$CheckoutSnacksVOToJson(this);
}