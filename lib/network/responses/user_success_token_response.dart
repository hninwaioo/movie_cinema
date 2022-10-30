import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../data/vos/user_data_vo.dart';
import '../../persistence/hive_constants.dart';
part 'user_success_token_response.g.dart';

@JsonSerializable()
@HiveType(typeId: HIVE_TYPE_ID_USER_DATA_TOKEN_VO, adapterName: "GetUserSuccessTokenResponseAdapter")

class GetUserSuccessTokenResponse{
  @JsonKey(name: "code")
  @HiveField(0)
  int? code;

  @JsonKey(name: "message")
  @HiveField(1)
  String? message;

  @JsonKey(name: "data")
  @HiveField(2)
  UserDataVO? userData;

  @JsonKey(name: "token")
  @HiveField(3)
  String? token;

  GetUserSuccessTokenResponse({
      this.code, this.message, this.userData, this.token});

  factory GetUserSuccessTokenResponse.fromJson(Map<String,dynamic> json) => _$GetUserSuccessTokenResponseFromJson(json);

  Map<String,dynamic> toJson() => _$GetUserSuccessTokenResponseToJson(this);
}