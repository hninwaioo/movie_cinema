// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_success_token_response.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GetUserSuccessTokenResponseAdapter
    extends TypeAdapter<GetUserSuccessTokenResponse> {
  @override
  final int typeId = 15;

  @override
  GetUserSuccessTokenResponse read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return GetUserSuccessTokenResponse(
      code: fields[0] as int?,
      message: fields[1] as String?,
      userData: fields[2] as UserDataVO?,
      token: fields[3] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, GetUserSuccessTokenResponse obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.code)
      ..writeByte(1)
      ..write(obj.message)
      ..writeByte(2)
      ..write(obj.userData)
      ..writeByte(3)
      ..write(obj.token);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GetUserSuccessTokenResponseAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetUserSuccessTokenResponse _$GetUserSuccessTokenResponseFromJson(
        Map<String, dynamic> json) =>
    GetUserSuccessTokenResponse(
      code: json['code'] as int?,
      message: json['message'] as String?,
      userData: json['data'] == null
          ? null
          : UserDataVO.fromJson(json['data'] as Map<String, dynamic>),
      token: json['token'] as String?,
    );

Map<String, dynamic> _$GetUserSuccessTokenResponseToJson(
        GetUserSuccessTokenResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.userData,
      'token': instance.token,
    };
