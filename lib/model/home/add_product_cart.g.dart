// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_product_cart.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddProductCart _$AddProductCartFromJson(Map<String, dynamic> json) =>
    AddProductCart()
      ..productId = json['product_id'] as String?
      ..note = json['note'] as String?
      ..options =
          (json['options'] as List<dynamic>?)?.map((e) => e as String).toList();

Map<String, dynamic> _$AddProductCartToJson(AddProductCart instance) =>
    <String, dynamic>{
      'product_id': instance.productId,
      'note': instance.note,
      'options': instance.options,
    };
