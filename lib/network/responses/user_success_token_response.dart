import 'package:json_annotation/json_annotation.dart';

import '../../data/vos/user_data_vo.dart';
part 'user_success_token_response.g.dart';

@JsonSerializable()
class GetUserSuccessTokenResponse{
  @JsonKey(name: "code")
  int? code;

  @JsonKey(name: "message")
  String? message;

  @JsonKey(name: "data")
  UserDataVO? userData;

  @JsonKey(name: "token")
  String? token;

  GetUserSuccessTokenResponse(
      this.code, this.message, this.userData, this.token);

  factory GetUserSuccessTokenResponse.fromJson(Map<String,dynamic> json) => _$GetUserSuccessTokenResponseFromJson(json);

  Map<String,dynamic> toJson() => _$GetUserSuccessTokenResponseToJson(this);
}