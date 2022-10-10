import 'package:json_annotation/json_annotation.dart';
import '../../data/vos/cinema/cinema_vo.dart';

part 'get_cinema_response.g.dart';

@JsonSerializable()
class CinemaResponse{
  @JsonKey(name: "code")
  int? code;
  @JsonKey(name: "message")
  String? message;
  @JsonKey(name: "data")
  List<CinemaVO>? cinemaList;
  @JsonKey(name: "latest_time")
  String? latestTime;

  CinemaResponse(this.code, this.message, this.cinemaList, this.latestTime);

  factory CinemaResponse.fromJson(Map<String,dynamic> json) => _$CinemaResponseFromJson(json);

  Map<String,dynamic> toJson() => _$CinemaResponseToJson(this);

}