// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderBody _$OrderBodyFromJson(Map<String, dynamic> json) => OrderBody()
  ..recipient = json['recipient'] as String?
  ..phone = json['phone'] as String?
  ..email = json['email'] as String?
  ..description = json['description'] as String?
  ..deliverMethod = json['deliver_method'] as String?
  ..addressData = json['order_address'] == null
      ? null
      : OrderAddressBody.fromJson(json['order_address'] as Map<String, dynamic>)
  ..cartId = json['cart_id'] as String?
  ..desiredDeliveryTime = json['desired_delivery_time'] as String?
  ..env = json['env'] as String?;

Map<String, dynamic> _$OrderBodyToJson(OrderBody instance) => <String, dynamic>{
      'recipient': instance.recipient,
      'phone': instance.phone,
      'email': instance.email,
      'description': instance.description,
      'deliver_method': instance.deliverMethod,
      'order_address': instance.addressData,
      'cart_id': instance.cartId,
      'desired_delivery_time': instance.desiredDeliveryTime,
      'env': instance.env,
    };
