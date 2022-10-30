// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_config_response.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ConfigResponseAdapter extends TypeAdapter<ConfigResponse> {
  @override
  final int typeId = 20;

  @override
  ConfigResponse read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ConfigResponse(
      fields[0] as int?,
      fields[1] as String?,
      (fields[2] as List?)?.cast<ConfigDataVO>(),
    );
  }

  @override
  void write(BinaryWriter writer, ConfigResponse obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.code)
      ..writeByte(1)
      ..write(obj.message)
      ..writeByte(2)
      ..write(obj.configDataVO);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ConfigResponseAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConfigResponse _$ConfigResponseFromJson(Map<String, dynamic> json) =>
    ConfigResponse(
      json['code'] as int?,
      json['message'] as String?,
      (json['data'] as List<dynamic>?)
          ?.map((e) => ConfigDataVO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ConfigResponseToJson(ConfigResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.configDataVO,
    };
