import 'package:json_annotation/json_annotation.dart';
part 'config_value_list_vo.g.dart';

@JsonSerializable()
class ConfigValueListVO {
  @JsonKey(name: "id")
  int? id;

  @JsonKey(name: "title")
  String? title;

  @JsonKey(name: "color")
  String? color;

  ConfigValueListVO(this.id, this.title, this.color);

  factory ConfigValueListVO.fromJson(Map<String,dynamic> json) => _$ConfigValueListVOFromJson(json);

  Map<String,dynamic> toJson() => _$ConfigValueListVOToJson(this);
}