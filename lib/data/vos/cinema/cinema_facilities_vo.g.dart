// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cinema_facilities_vo.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CinemaFacilitiesVOAdapter extends TypeAdapter<CinemaFacilitiesVO> {
  @override
  final int typeId = 22;

  @override
  CinemaFacilitiesVO read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CinemaFacilitiesVO(
      fields[0] as int?,
      fields[1] as String?,
      fields[2] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, CinemaFacilitiesVO obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.img);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CinemaFacilitiesVOAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CinemaFacilitiesVO _$CinemaFacilitiesVOFromJson(Map<String, dynamic> json) =>
    CinemaFacilitiesVO(
      json['id'] as int?,
      json['title'] as String?,
      json['img'] as String?,
    );

Map<String, dynamic> _$CinemaFacilitiesVOToJson(CinemaFacilitiesVO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'img': instance.img,
    };
