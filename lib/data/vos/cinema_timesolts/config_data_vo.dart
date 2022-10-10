import 'package:json_annotation/json_annotation.dart';
part 'config_data_vo.g.dart';

@JsonSerializable()
class ConfigDataVO {
  @JsonKey(name: "id")
  int? id;

  @JsonKey(name: "key")
  String? key;

  @JsonKey(name: "value")
  dynamic value;

  ConfigDataVO(this.id, this.key, this.value);

  factory ConfigDataVO.fromJson(Map<String,dynamic> json) => _$ConfigDataVOFromJson(json);

  Map<String,dynamic> toJson() => _$ConfigDataVOToJson(this);
}