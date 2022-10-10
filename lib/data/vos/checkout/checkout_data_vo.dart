import 'package:json_annotation/json_annotation.dart';
import 'package:movie_cinema/data/vos/checkout/checkout_timeslots_vo.dart';

import 'checkout_snacks_vo.dart';
part 'checkout_data_vo.g.dart';

@JsonSerializable()
class CheckoutDataVO {
  @JsonKey(name: "id")
  int? id;

  @JsonKey(name: "booking_no")
  String? bookingNo;

  @JsonKey(name: "booking_date")
  String? bookingDate;

  @JsonKey(name: "row")
  String? row;

  @JsonKey(name: "seat")
  String? seat;

  @JsonKey(name: "total_seat")
  int? totalSeat;

  @JsonKey(name: "total")
  String? total;

  @JsonKey(name: "movie_id")
  int? movieId;

  @JsonKey(name: "cinema_id")
  int? cinemaId;

  @JsonKey(name: "username")
  String? username;

  @JsonKey(name: "timeslot")
  CheckoutTimeslotsVO? timeslotsVO;

  @JsonKey(name: "snacks")
  List<CheckoutSnacksVO>? checkoutSnacksList;

  @JsonKey(name: "qr_code")
  String? qrCode;

  CheckoutDataVO(
      this.id,
      this.bookingNo,
      this.bookingDate,
      this.row,
      this.seat,
      this.totalSeat,
      this.total,
      this.movieId,
      this.cinemaId,
      this.username,
      this.timeslotsVO,
      this.checkoutSnacksList,
      this.qrCode);

  factory CheckoutDataVO.fromJson(Map<String,dynamic> json) => _$CheckoutDataVOFromJson(json);

  Map<String,dynamic> toJson() => _$CheckoutDataVOToJson(this);
}