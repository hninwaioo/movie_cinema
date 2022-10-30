import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:movie_cinema/persistence/hive_constants.dart';

import '../../data/vos/cinema_timeslots/config_data_vo.dart';
part 'get_config_response.g.dart';

@JsonSerializable()
@HiveType(typeId: HIVE_TYPE_ID_GET_CONFIG_RESPONSE_VO, adapterName: "ConfigResponseAdapter")

class ConfigResponse {
  @JsonKey(name: "code")
  @HiveField(0)
  int? code;

  @JsonKey(name: "message")
  @HiveField(1)
  String? message;

  @JsonKey(name: "data")
  @HiveField(2)
  List<ConfigDataVO>? configDataVO;

  ConfigResponse(this.code, this.message, this.configDataVO);

  factory ConfigResponse.fromJson(Map<String,dynamic> json) => _$ConfigResponseFromJson(json);

  Map<String,dynamic> toJson() => _$ConfigResponseToJson(this);

}