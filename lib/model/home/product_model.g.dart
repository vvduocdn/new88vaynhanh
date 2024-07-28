// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductModelResponse _$ProductModelResponseFromJson(
        Map<String, dynamic> json) =>
    ProductModelResponse()
      ..total = (json['total'] as num?)?.toInt()
      ..records = (json['records'] as List<dynamic>?)
          ?.map((e) => ProductModel.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$ProductModelResponseToJson(
        ProductModelResponse instance) =>
    <String, dynamic>{
      'total': instance.total,
      'records': instance.records,
    };

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) => ProductModel()
  ..id = json['id'] as String?
  ..createdAt = json['created_at'] == null
      ? null
      : DateTime.parse(json['created_at'] as String)
  ..updatedAt = json['updated_at'] == null
      ? null
      : DateTime.parse(json['updated_at'] as String)
  ..isDeleted = json['is_deleted'] as bool?
  ..deletedAt = json['deleted_at'] == null
      ? null
      : DateTime.parse(json['deleted_at'] as String)
  ..status = json['status'] as String?
  ..name = json['name'] as String?
  ..price = (json['price'] as num?)?.toDouble()
  ..quantity = (json['quantity'] as num?)?.toInt()
  ..thumbnail = json['thumbnail'] as String?
  ..description = json['description'] as String?
  ..images =
      (json['images'] as List<dynamic>?)?.map((e) => e as String).toList()
  ..ingredient =
      (json['ingredient'] as List<dynamic>?)?.map((e) => e as String).toList()
  ..menuId = json['menu_id'] as String?
  ..restaurantId = json['restaurant_id'] as String?
  ..createdBy = json['created_by'] as String?
  ..menu = json['menu'] == null
      ? null
      : Menu.fromJson(json['menu'] as Map<String, dynamic>)
  ..options = (json['options'] as List<dynamic>?)
      ?.map((e) => OptionsProduct.fromJson(e as Map<String, dynamic>))
      .toList();

Map<String, dynamic> _$ProductModelToJson(ProductModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'is_deleted': instance.isDeleted,
      'deleted_at': instance.deletedAt?.toIso8601String(),
      'status': instance.status,
      'name': instance.name,
      'price': instance.price,
      'quantity': instance.quantity,
      'thumbnail': instance.thumbnail,
      'description': instance.description,
      'images': instance.images,
      'ingredient': instance.ingredient,
      'menu_id': instance.menuId,
      'restaurant_id': instance.restaurantId,
      'created_by': instance.createdBy,
      'menu': instance.menu,
      'options': instance.options,
    };

Menu _$MenuFromJson(Map<String, dynamic> json) => Menu()
  ..id = json['id'] as String?
  ..createdAt = json['created_at'] == null
      ? null
      : DateTime.parse(json['created_at'] as String)
  ..updatedAt = json['updated_at'] == null
      ? null
      : DateTime.parse(json['updated_at'] as String)
  ..isDeleted = json['is_deleted'] as bool?
  ..deletedAt = json['deleted_at'] == null
      ? null
      : DateTime.parse(json['deleted_at'] as String)
  ..name = json['name'] as String?
  ..path = json['path'] as String?
  ..images =
      (json['images'] as List<dynamic>?)?.map((e) => e as String).toList()
  ..thumbnail = json['thumbnail'] as String?
  ..description = json['description'] as String?
  ..parentId = json['parent_id'] as String?
  ..restaurantId = json['restaurant_id'] as String?
  ..createdBy = json['created_by'] as String?;

Map<String, dynamic> _$MenuToJson(Menu instance) => <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'is_deleted': instance.isDeleted,
      'deleted_at': instance.deletedAt?.toIso8601String(),
      'name': instance.name,
      'path': instance.path,
      'images': instance.images,
      'thumbnail': instance.thumbnail,
      'description': instance.description,
      'parent_id': instance.parentId,
      'restaurant_id': instance.restaurantId,
      'created_by': instance.createdBy,
    };

OptionsProduct _$OptionsProductFromJson(Map<String, dynamic> json) =>
    OptionsProduct()
      ..id = json['id'] as String?
      ..name = json['name'] as String?
      ..price = (json['price'] as num?)?.toDouble();

Map<String, dynamic> _$OptionsProductToJson(OptionsProduct instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'price': instance.price,
    };
