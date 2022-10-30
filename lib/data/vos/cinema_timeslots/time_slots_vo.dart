import 'package:hive_flutter/adapters.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:movie_cinema/persistence/hive_constants.dart';
part 'time_slots_vo.g.dart';

@JsonSerializable()
@HiveType(typeId: HIVE_TYPE_ID_TIMESLOTS_VO, adapterName: "TimeslotsVOAdapter")
class TimeslotsVO{
  @JsonKey(name: "cinema_day_timeslot_id")
  @HiveField(0)
  int? cinemaDayTimeslotId;

  @JsonKey(name: "start_time")
  @HiveField(1)
  String? startTime;

  @JsonKey(name: "status")
  @HiveField(2)
  int? status;

  TimeslotsVO(this.cinemaDayTimeslotId, this.startTime, this.status);

  factory TimeslotsVO.fromJson(Map<String,dynamic> json) => _$TimeslotsVOFromJson(json);

  Map<String,dynamic> toJson() => _$TimeslotsVOToJson(this);
}