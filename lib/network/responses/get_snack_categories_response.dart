import 'package:json_annotation/json_annotation.dart';

import '../../data/vos/snack/snack_categories_vo.dart';
part 'get_snack_categories_response.g.dart';

@JsonSerializable()
class SnackCategoriesResponse {
  @JsonKey(name: "code")
  int? code;

  @JsonKey(name: "message")
  String? message;

  @JsonKey(name: "data")
  List<SnackCategoriesVO>? snackCategoriesList;

  SnackCategoriesResponse(this.code, this.message, this.snackCategoriesList);

  factory SnackCategoriesResponse.fromJson(Map<String,dynamic> json) => _$SnackCategoriesResponseFromJson(json);

  Map<String,dynamic> toJson() => _$SnackCategoriesResponseToJson(this);
}