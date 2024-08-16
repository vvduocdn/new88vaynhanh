// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'social_network.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SocialNetworkAdapter extends TypeAdapter<SocialNetwork> {
  @override
  final int typeId = 2;

  @override
  SocialNetwork read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SocialNetwork()
      ..type = fields[0] as int?
      ..link = fields[1] as String?
      ..socialNetworkName = fields[2] as String?;
  }

  @override
  void write(BinaryWriter writer, SocialNetwork obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.type)
      ..writeByte(1)
      ..write(obj.link)
      ..writeByte(2)
      ..write(obj.socialNetworkName);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) => identical(this, other) || other is SocialNetworkAdapter && runtimeType == other.runtimeType && typeId == other.typeId;
}
