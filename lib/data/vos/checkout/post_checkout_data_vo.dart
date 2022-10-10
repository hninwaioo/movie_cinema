import 'package:json_annotation/json_annotation.dart';
import 'package:movie_cinema/data/vos/checkout/post_checkout_snacks_vo.dart';
import 'package:movie_cinema/data/vos/snack/add_snack_list_vo.dart';
part 'post_checkout_data_vo.g.dart';

@JsonSerializable()
class PostCheckOutDataVO {
  @JsonKey(name: "cinema_day_timeslot_id")
  int? cinemaDayTimeslotId;

  @JsonKey(name: "seat_number")
  String? seatNumber;

  @JsonKey(name: "booking_date")
  String? bookingDate;

  @JsonKey(name: "movie_id")
  int? movieId;

  @JsonKey(name: "payment_type_id")
  int? paymentTypeId;

  @JsonKey(name: "snacks")
  List<AddSnackListVO>? postCheckOutSnacksVO;

  PostCheckOutDataVO({
      required this.cinemaDayTimeslotId,
      required this.seatNumber,
      required this.bookingDate,
      required this.movieId,
      required this.paymentTypeId,
      required this.postCheckOutSnacksVO});

  factory PostCheckOutDataVO.fromJson(Map<String,dynamic> json) => _$PostCheckOutDataVOFromJson(json);

  Map<String,dynamic> toJson() => _$PostCheckOutDataVOToJson(this);

}