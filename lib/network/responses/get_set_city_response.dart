import 'package:json_annotation/json_annotation.dart';
part 'get_set_city_response.g.dart';

@JsonSerializable()
class SetCityResponse{

  @JsonKey(name: "code")
  int? code;
  @JsonKey(name: "message")
  String? message;

  SetCityResponse(this.code, this.message);

  factory SetCityResponse.fromJson(Map<String,dynamic> json) => _$SetCityResponseFromJson(json);

  Map<String,dynamic> toJson() => _$SetCityResponseToJson(this);

}