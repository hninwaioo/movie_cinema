import 'package:json_annotation/json_annotation.dart';
import 'package:movie_cinema/data/vos/cinema_timesolts/time_solts_vo.dart';
part 'cinema_data_vo.g.dart';

@JsonSerializable()
class CinemaDataVO {
  @JsonKey(name: "cinema_id")
  int? cinemaId;

  @JsonKey(name: "cinema")
  String? cinema;

  @JsonKey(name: "timeslots")
  List<TimesoltsVO>? timeslots;

  CinemaDataVO(this.cinemaId, this.cinema, this.timeslots);

  factory CinemaDataVO.fromJson(Map<String,dynamic> json) => _$CinemaDataVOFromJson(json);

  Map<String,dynamic> toJson() => _$CinemaDataVOToJson(this);
}

