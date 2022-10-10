import 'package:json_annotation/json_annotation.dart';
part 'get_otp_response.g.dart';

@JsonSerializable()
class OTPResponse{

  @JsonKey(name: "code")
  int? code;

  @JsonKey(name: "message")
  String? message;

  OTPResponse(this.code, this.message);

  factory OTPResponse.fromJson(Map<String,dynamic> json) => _$OTPResponseFromJson(json);

  Map<String,dynamic> toJson() => _$OTPResponseToJson(this);
}