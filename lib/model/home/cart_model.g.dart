// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartModel _$CartModelFromJson(Map<String, dynamic> json) => CartModel()
  ..id = json['id'] as String?
  ..createdAt = json['created_at'] as String?
  ..updatedAt = json['updated_at'] as String?
  ..isDeleted = json['is_deleted'] as bool?
  ..deletedAt = json['deleted_at'] as String?
  ..createdBy = json['created_by'] as String?
  ..restaurantId = json['restaurant_id'] as String?
  ..products = (json['products'] as List<dynamic>?)
      ?.map((e) => ProductCartModel.fromJson(e as Map<String, dynamic>))
      .toList()
  ..totalPrice = (json['total_price'] as num?)?.toDouble();

Map<String, dynamic> _$CartModelToJson(CartModel instance) => <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'is_deleted': instance.isDeleted,
      'deleted_at': instance.deletedAt,
      'created_by': instance.createdBy,
      'restaurant_id': instance.restaurantId,
      'products': instance.products,
      'total_price': instance.totalPrice,
    };

ProductCartModel _$ProductCartModelFromJson(Map<String, dynamic> json) =>
    ProductCartModel()
      ..id = json['id'] as String?
      ..name = json['name'] as String?
      ..price = (json['price'] as num?)?.toDouble()
      ..quantity = (json['quantity'] as num?)?.toInt()
      ..thumbnail = json['thumbnail'] as String?
      ..total = (json['total'] as num?)?.toDouble()
      ..note = json['note'] as String?
      ..options = (json['options'] as List<dynamic>?)
          ?.map(
              (e) => OptionsProductResponse.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$ProductCartModelToJson(ProductCartModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'price': instance.price,
      'quantity': instance.quantity,
      'thumbnail': instance.thumbnail,
      'total': instance.total,
      'note': instance.note,
      'options': instance.options,
    };

OptionsProductResponse _$OptionsProductResponseFromJson(
        Map<String, dynamic> json) =>
    OptionsProductResponse()
      ..id = json['id'] as String?
      ..name = json['name'] as String?
      ..price = (json['price'] as num?)?.toDouble();

Map<String, dynamic> _$OptionsProductResponseToJson(
        OptionsProductResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'price': instance.price,
    };
