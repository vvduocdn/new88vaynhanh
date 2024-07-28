// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartBody _$CartBodyFromJson(Map<String, dynamic> json) => CartBody()
  ..productId = json['product_id'] as String?
  ..quantity = (json['quantity'] as num?)?.toInt()
  ..note = json['note'] as String?
  ..options =
      (json['options'] as List<dynamic>?)?.map((e) => e as String).toList();

Map<String, dynamic> _$CartBodyToJson(CartBody instance) => <String, dynamic>{
      'product_id': instance.productId,
      'quantity': instance.quantity,
      'note': instance.note,
      'options': instance.options,
    };
