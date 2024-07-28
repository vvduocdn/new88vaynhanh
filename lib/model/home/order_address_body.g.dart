// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_address_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderAddressBody _$OrderAddressBodyFromJson(Map<String, dynamic> json) =>
    OrderAddressBody()
      ..phoneNumber = json['phone_number'] as String?
      ..name = json['name'] as String?
      ..address = json['address'] as String?
      ..city = json['city'] as String?
      ..country = json['country'] as String?
      ..zipCode = json['zip_code'] as String?
      ..addressDetail = json['address_detail'] as String?;

Map<String, dynamic> _$OrderAddressBodyToJson(OrderAddressBody instance) =>
    <String, dynamic>{
      'phone_number': instance.phoneNumber,
      'name': instance.name,
      'address': instance.address,
      'city': instance.city,
      'country': instance.country,
      'zip_code': instance.zipCode,
      'address_detail': instance.addressDetail,
    };
