
import 'package:json_annotation/json_annotation.dart';
part 'date_vo.g.dart';

@JsonSerializable()
class DateVo {
  @JsonKey(name: "maximum")
  String? maximum;

  @JsonKey(name: "minimum")
  String? minimum;

  DateVo(this.maximum, this.minimum);

  factory DateVo.fromJson(Map<String,dynamic> json) => _$DateVoFromJson(json);


  Map<String,dynamic> toJson() => _$DateVoToJson(this);

}