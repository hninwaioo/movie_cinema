import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../persistence/hive_constants.dart';
part 'config_data_vo.g.dart';

@JsonSerializable()

@HiveType(typeId: HIVE_TYPE_ID_CONFIG_DATA_VO, adapterName: "ConfigDataVOAdapter")
class ConfigDataVO {
  @JsonKey(name: "id")
  @HiveField(0)
  int? id;

  @JsonKey(name: "key")
  @HiveField(1)
  String? key;

  @JsonKey(name: "value")
  @HiveField(2)
  dynamic value;

  ConfigDataVO(this.id, this.key, this.value);

  factory ConfigDataVO.fromJson(Map<String,dynamic> json) => _$ConfigDataVOFromJson(json);

  Map<String,dynamic> toJson() => _$ConfigDataVOToJson(this);
}