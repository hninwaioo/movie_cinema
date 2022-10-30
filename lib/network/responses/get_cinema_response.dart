import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:movie_cinema/persistence/hive_constants.dart';
import '../../data/vos/cinema/cinema_vo.dart';

part 'get_cinema_response.g.dart';

@JsonSerializable()
@HiveType(typeId: HIVE_TYPE_ID_GET_CINEMA_RESPONSE_VO, adapterName: "CinemaResponseAdapter")
class CinemaResponse{
  @JsonKey(name: "code")
  @HiveField(0)
  int? code;

  @JsonKey(name: "message")
  @HiveField(1)
  String? message;

  @JsonKey(name: "data")
  @HiveField(2)
  List<CinemaVO>? cinemaList;

  @JsonKey(name: "latest_time")
  @HiveField(3)
  String? latestTime;

  CinemaResponse(this.code, this.message, this.cinemaList, this.latestTime);

  factory CinemaResponse.fromJson(Map<String,dynamic> json) => _$CinemaResponseFromJson(json);

  Map<String,dynamic> toJson() => _$CinemaResponseToJson(this);

}