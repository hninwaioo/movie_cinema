// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_cinema_response.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CinemaResponseAdapter extends TypeAdapter<CinemaResponse> {
  @override
  final int typeId = 23;

  @override
  CinemaResponse read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CinemaResponse(
      fields[0] as int?,
      fields[1] as String?,
      (fields[2] as List?)?.cast<CinemaVO>(),
      fields[3] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, CinemaResponse obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.code)
      ..writeByte(1)
      ..write(obj.message)
      ..writeByte(2)
      ..write(obj.cinemaList)
      ..writeByte(3)
      ..write(obj.latestTime);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CinemaResponseAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CinemaResponse _$CinemaResponseFromJson(Map<String, dynamic> json) =>
    CinemaResponse(
      json['code'] as int?,
      json['message'] as String?,
      (json['data'] as List<dynamic>?)
          ?.map((e) => CinemaVO.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['latest_time'] as String?,
    );

Map<String, dynamic> _$CinemaResponseToJson(CinemaResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.cinemaList,
      'latest_time': instance.latestTime,
    };
