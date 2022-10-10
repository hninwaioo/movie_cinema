import 'package:json_annotation/json_annotation.dart';
part 'credit_crew_vo.g.dart';
@JsonSerializable()
class CreditCrewVO {
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
  @JsonKey(name: "credit_id")
  String? credit_id;
  @JsonKey(name: "department")
  String? department;
  @JsonKey(name: "job")
  String? job;

  CreditCrewVO(
      this.adult,
      this.gender,
      this.id,
      this.known_for_department,
      this.name,
      this.original_name,
      this.popularity,
      this.profile_path,
      this.credit_id,
      this.department,
      this.job);

  factory CreditCrewVO.fromJson(Map<String,dynamic> json) => _$CreditCrewVOFromJson(json);

  Map<String,dynamic> toJson() => _$CreditCrewVOToJson(this);
}