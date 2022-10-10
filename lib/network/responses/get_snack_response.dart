import 'package:json_annotation/json_annotation.dart';

import '../../data/vos/snack/snack_vo.dart';
part 'get_snack_response.g.dart';

@JsonSerializable()
class SnackResponse {
  @JsonKey(name: "code")
  int? code;

  @JsonKey(name: "message")
  String? message;

  @JsonKey(name: "data")
  List<SnackVO>? snackList;

  SnackResponse(this.code, this.message, this.snackList);

  factory SnackResponse.fromJson(Map<String,dynamic> json) => _$SnackResponseFromJson(json);

  Map<String,dynamic> toJson() => _$SnackResponseToJson(this);
}