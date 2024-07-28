// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_address_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderAddressModel _$OrderAddressModelFromJson(Map<String, dynamic> json) =>
    OrderAddressModel()
      ..id = json['id'] as String?
      ..phoneNumber = json['phone_number'] as String?
      ..name = json['name'] as String?
      ..address = json['address'] as String?
      ..city = json['city'] as String?
      ..country = json['country'] as String?
      ..zipCode = json['zip_code'] as String?
      ..addressDetail = json['address_detail'] as String?;

Map<String, dynamic> _$OrderAddressModelToJson(OrderAddressModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'phone_number': instance.phoneNumber,
      'name': instance.name,
      'address': instance.address,
      'city': instance.city,
      'country': instance.country,
      'zip_code': instance.zipCode,
      'address_detail': instance.addressDetail,
    };
