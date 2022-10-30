// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'checkout_data_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CheckoutDataVO _$CheckoutDataVOFromJson(Map<String, dynamic> json) =>
    CheckoutDataVO(
      json['id'] as int?,
      json['booking_no'] as String?,
      json['booking_date'] as String?,
      json['row'] as String?,
      json['seat'] as String?,
      json['total_seat'] as int?,
      json['total'] as String?,
      json['movie_id'] as int?,
      json['cinema_id'] as int?,
      json['username'] as String?,
      json['timeslot'] == null
          ? null
          : CheckoutTimeslotsVO.fromJson(
              json['timeslot'] as Map<String, dynamic>),
      (json['snacks'] as List<dynamic>?)
          ?.map((e) => CheckoutSnacksVO.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['qr_code'] as String?,
    );

Map<String, dynamic> _$CheckoutDataVOToJson(CheckoutDataVO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'booking_no': instance.bookingNo,
      'booking_date': instance.bookingDate,
      'row': instance.row,
      'seat': instance.seat,
      'total_seat': instance.totalSeat,
      'total': instance.total,
      'movie_id': instance.movieId,
      'cinema_id': instance.cinemaId,
      'username': instance.username,
      'timeslot': instance.timeslotsVO,
      'snacks': instance.checkoutSnacksList,
      'qr_code': instance.qrCode,
    };
