// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_address_hive.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class OrderAddressHiveAdapter extends TypeAdapter<OrderAddressHive> {
  @override
  final int typeId = 4;

  @override
  OrderAddressHive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return OrderAddressHive(
      address: fields[0] as String?,
      city: fields[1] as String?,
      country: fields[2] as String?,
      zipCode: fields[3] as String?,
      addressDetail: fields[4] as String?,
      phone: fields[5] as String?,
      name: fields[6] as String?,
      id: fields[7] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, OrderAddressHive obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.address)
      ..writeByte(1)
      ..write(obj.city)
      ..writeByte(2)
      ..write(obj.country)
      ..writeByte(3)
      ..write(obj.zipCode)
      ..writeByte(4)
      ..write(obj.addressDetail)
      ..writeByte(5)
      ..write(obj.phone)
      ..writeByte(6)
      ..write(obj.name)
      ..writeByte(7)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OrderAddressHiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
