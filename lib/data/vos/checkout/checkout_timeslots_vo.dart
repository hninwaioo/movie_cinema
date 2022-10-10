import 'package:json_annotation/json_annotation.dart';
part 'checkout_timeslots_vo.g.dart';

@JsonSerializable()
class CheckoutTimeslotsVO {
  @JsonKey(name: "cinema_day_timeslot_id")
  int? cinemaDayTimeslotId;

  @JsonKey(name: "start_time")
  String? startTime;

  CheckoutTimeslotsVO(this.cinemaDayTimeslotId, this.startTime);

  factory CheckoutTimeslotsVO.fromJson(Map<String,dynamic> json) => _$CheckoutTimeslotsVOFromJson(json);

  Map<String,dynamic> toJson() => _$CheckoutTimeslotsVOToJson(this);
}