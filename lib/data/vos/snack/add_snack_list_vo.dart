import 'package:json_annotation/json_annotation.dart';
part 'add_snack_list_vo.g.dart';

@JsonSerializable()
class AddSnackListVO {
  @JsonKey(name: "id")
  int id = 1;

  @JsonKey(name: "quantity")
  int quantity = 0;

  @JsonKey(name: "snackName")
  String snackName = "";

  @JsonKey(name: "totalPrice")
  int totalPrice = 0;

  // AddSnackListVO(this.snackName, this.number, this.totalPrice);

  AddSnackListVO({
    required this.id,
    required this.quantity,
    required this.snackName,
    required this.totalPrice,
  });


  factory AddSnackListVO.fromJson(Map<String,dynamic> json) => _$AddSnackListVOFromJson(json);

  Map<String,dynamic> toJson() => _$AddSnackListVOToJson(this);
}