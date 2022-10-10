import 'package:json_annotation/json_annotation.dart';

import '../../data/vos/cinema_timesolts/config_data_vo.dart';
part 'get_config_response.g.dart';

@JsonSerializable()
class ConfigResponse {
  @JsonKey(name: "code")
  int? code;

  @JsonKey(name: "message")
  String? message;

  @JsonKey(name: "data")
  List<ConfigDataVO>? configDataVO;

  ConfigResponse(this.code, this.message, this.configDataVO);

  factory ConfigResponse.fromJson(Map<String,dynamic> json) => _$ConfigResponseFromJson(json);

  Map<String,dynamic> toJson() => _$ConfigResponseToJson(this);

}