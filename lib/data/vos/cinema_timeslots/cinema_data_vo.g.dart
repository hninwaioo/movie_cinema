// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cinema_data_vo.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CinemaDataVOAdapter extends TypeAdapter<CinemaDataVO> {
  @override
  final int typeId = 24;

  @override
  CinemaDataVO read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CinemaDataVO(
      fields[0] as int?,
      fields[1] as String?,
      (fields[2] as List?)?.cast<TimeslotsVO>(),
    );
  }

  @override
  void write(BinaryWriter writer, CinemaDataVO obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.cinemaId)
      ..writeByte(1)
      ..write(obj.cinema)
      ..writeByte(2)
      ..write(obj.timeslots);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CinemaDataVOAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CinemaDataVO _$CinemaDataVOFromJson(Map<String, dynamic> json) => CinemaDataVO(
      json['cinema_id'] as int?,
      json['cinema'] as String?,
      (json['timeslots'] as List<dynamic>?)
          ?.map((e) => TimeslotsVO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CinemaDataVOToJson(CinemaDataVO instance) =>
    <String, dynamic>{
      'cinema_id': instance.cinemaId,
      'cinema': instance.cinema,
      'timeslots': instance.timeslots,
    };
