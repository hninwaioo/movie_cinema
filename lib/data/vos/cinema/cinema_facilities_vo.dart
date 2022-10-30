import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:movie_cinema/persistence/hive_constants.dart';
part 'cinema_facilities_vo.g.dart';

@JsonSerializable()
@HiveType(typeId: HIVE_TYPE_ID_CINEMA_FACILITIES_VO, adapterName: "CinemaFacilitiesVOAdapter")
class CinemaFacilitiesVO {
  @JsonKey(name: "id")
  @HiveField(0)
  int? id;

  @JsonKey(name: "title")
  @HiveField(1)
  String? title;

  @JsonKey(name: "img")
  @HiveField(2)
  String? img;

  CinemaFacilitiesVO(this.id, this.title, this.img);

  factory CinemaFacilitiesVO.fromJson(Map<String,dynamic> json) => _$CinemaFacilitiesVOFromJson(json);

  Map<String,dynamic> toJson() => _$CinemaFacilitiesVOToJson(this);


}