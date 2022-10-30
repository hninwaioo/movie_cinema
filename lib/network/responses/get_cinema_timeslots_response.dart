import 'package:hive_flutter/adapters.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:movie_cinema/data/vos/cinema_timeslots/cinema_data_vo.dart';
import 'package:movie_cinema/persistence/hive_constants.dart';
part 'get_cinema_timeslots_response.g.dart';

@JsonSerializable()
@HiveType(typeId: HIVE_TYPE_ID_CINEMA_TIMESLOTS_RESPONSE,adapterName: "CinemaTimeslotsResponseAdapter")
class CinemaTimeslotsResponse{
  @JsonKey(name: "code")
  @HiveField(0)
  int? code;

  @JsonKey(name: "message")
  @HiveField(1)
  String? message;

  @JsonKey(name: "data")
  @HiveField(2)
  List<CinemaDataVO> cinemaDataVO;

  CinemaTimeslotsResponse(this.code, this.message, this.cinemaDataVO);

  factory CinemaTimeslotsResponse.fromJson(Map<String,dynamic> json) => _$CinemaTimeslotsResponseFromJson(json);

  Map<String,dynamic> toJson() => _$CinemaTimeslotsResponseToJson(this);
}