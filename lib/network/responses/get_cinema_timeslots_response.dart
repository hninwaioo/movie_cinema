import 'package:json_annotation/json_annotation.dart';
import 'package:movie_cinema/data/vos/cinema_timesolts/cinema_data_vo.dart';
part 'get_cinema_timeslots_response.g.dart';

@JsonSerializable()
class CinemaTimeslotsResponse{
  @JsonKey(name: "code")
  int? code;

  @JsonKey(name: "message")
  String? message;

  @JsonKey(name: "data")
  List<CinemaDataVO> cinemaDataVO;

  CinemaTimeslotsResponse(this.code, this.message, this.cinemaDataVO);

  factory CinemaTimeslotsResponse.fromJson(Map<String,dynamic> json) => _$CinemaTimeslotsResponseFromJson(json);

  Map<String,dynamic> toJson() => _$CinemaTimeslotsResponseToJson(this);
}