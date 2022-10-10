import 'package:json_annotation/json_annotation.dart';
part 'time_solts_vo.g.dart';

@JsonSerializable()
class TimesoltsVO{
  @JsonKey(name: "cinema_day_timeslot_id")
  int? cinemaDayTimeslotId;

  @JsonKey(name: "start_time")
  String? startTime;

  @JsonKey(name: "status")
  int? status;

  TimesoltsVO(this.cinemaDayTimeslotId, this.startTime, this.status);

  factory TimesoltsVO.fromJson(Map<String,dynamic> json) => _$TimesoltsVOFromJson(json);

  Map<String,dynamic> toJson() => _$TimesoltsVOToJson(this);
}