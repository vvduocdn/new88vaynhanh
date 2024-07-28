// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'jwt.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class JwtAdapter extends TypeAdapter<Jwt> {
  @override
  final int typeId = 1;

  @override
  Jwt read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Jwt(
      token: fields[0] as String?,
      expiredAt: fields[1] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Jwt obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.token)
      ..writeByte(1)
      ..write(obj.expiredAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is JwtAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
