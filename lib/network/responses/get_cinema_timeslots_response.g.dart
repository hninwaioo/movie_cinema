// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_cinema_timeslots_response.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CinemaTimeslotsResponseAdapter
    extends TypeAdapter<CinemaTimeslotsResponse> {
  @override
  final int typeId = 26;

  @override
  CinemaTimeslotsResponse read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CinemaTimeslotsResponse(
      fields[0] as int?,
      fields[1] as String?,
      (fields[2] as List).cast<CinemaDataVO>(),
    );
  }

  @override
  void write(BinaryWriter writer, CinemaTimeslotsResponse obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.code)
      ..writeByte(1)
      ..write(obj.message)
      ..writeByte(2)
      ..write(obj.cinemaDataVO);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CinemaTimeslotsResponseAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CinemaTimeslotsResponse _$CinemaTimeslotsResponseFromJson(
        Map<String, dynamic> json) =>
    CinemaTimeslotsResponse(
      json['code'] as int?,
      json['message'] as String?,
      (json['data'] as List<dynamic>)
          .map((e) => CinemaDataVO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CinemaTimeslotsResponseToJson(
        CinemaTimeslotsResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.cinemaDataVO,
    };
