import 'package:json_annotation/json_annotation.dart';
part 'credit_cast_vo.g.dart';

@JsonSerializable()
class CreditCastVO {
  @JsonKey(name: "adult")
  bool? adult;
  @JsonKey(name: "gender")
  int? gender;
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "known_for_department")
  String? known_for_department;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "original_name")
  String? original_name;
  @JsonKey(name: "popularity")
  double? popularity;
  @JsonKey(name: "profile_path")
  String? profile_path;
  @JsonKey(name: "cast_id")
  int? cast_id;
  @JsonKey(name: "character")
  String? character;
  @JsonKey(name: "credit_id")
  String? credit_id;
  @JsonKey(name: "order")
  int? order;
  @JsonKey(name: "department")
  String? department;
  @JsonKey(name: "job")
  String? job;

  CreditCastVO(
      this.adult,
      this.gender,
      this.id,
      this.known_for_department,
      this.name,
      this.original_name,
      this.popularity,
      this.profile_path,
      this.cast_id,
      this.character,
      this.credit_id,
      this.order,
      this.department,
      this.job);

  factory CreditCastVO.fromJson(Map<String,dynamic> json) => _$CreditCastVOFromJson(json);

  Map<String,dynamic> toJson() => _$CreditCastVOToJson(this);
}