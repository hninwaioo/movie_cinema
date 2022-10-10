import 'package:json_annotation/json_annotation.dart';
part 'post_checkout_snacks_vo.g.dart';

@JsonSerializable()
class PostCheckOutSnacksVO {
  @JsonKey(name: "id")
  int? id;

  @JsonKey(name: "quantity")
  int? quantity;

  PostCheckOutSnacksVO({
    required this.id,
    required this.quantity
  });

  factory PostCheckOutSnacksVO.fromJson(Map<String,dynamic> json) => _$PostCheckOutSnacksVOFromJson(json);

  Map<String,dynamic> toJson() => _$PostCheckOutSnacksVOToJson(this);

}