import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:movie_cinema/data/vos/cinema_timeslots/time_slots_vo.dart';
import '../../../persistence/hive_constants.dart';
part 'cinema_data_vo.g.dart';

@JsonSerializable()
@HiveType(typeId: HIVE_TYPE_ID_CINEMA_DATA_VO,adapterName: "CinemaDataVOAdapter")
class CinemaDataVO {
  @JsonKey(name: "cinema_id")
  @HiveField(0)
  int? cinemaId;

  @JsonKey(name: "cinema")
  @HiveField(1)
  String? cinema;

  @JsonKey(name: "timeslots")
  @HiveField(2)
  List<TimeslotsVO>? timeslots;

  CinemaDataVO(this.cinemaId, this.cinema, this.timeslots);

  factory CinemaDataVO.fromJson(Map<String,dynamic> json) => _$CinemaDataVOFromJson(json);

  Map<String,dynamic> toJson() => _$CinemaDataVOToJson(this);
}

