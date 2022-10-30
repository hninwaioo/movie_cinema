// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'checkout_timeslots_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CheckoutTimeslotsVO _$CheckoutTimeslotsVOFromJson(Map<String, dynamic> json) =>
    CheckoutTimeslotsVO(
      json['cinema_day_timeslot_id'] as int?,
      json['start_time'] as String?,
    );

Map<String, dynamic> _$CheckoutTimeslotsVOToJson(
        CheckoutTimeslotsVO instance) =>
    <String, dynamic>{
      'cinema_day_timeslot_id': instance.cinemaDayTimeslotId,
      'start_time': instance.startTime,
    };
