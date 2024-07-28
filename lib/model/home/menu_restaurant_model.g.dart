// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu_restaurant_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MenuRestaurantModel _$MenuRestaurantModelFromJson(Map<String, dynamic> json) =>
    MenuRestaurantModel()
      ..id = json['id'] as String?
      ..createdAt = json['created_at'] as String?
      ..updatedAt = json['updated_at'] as String?
      ..isDeleted = json['is_deleted'] as bool?
      ..deletedAt = json['deleted_at'] as bool?
      ..path = json['path'] as String?
      ..name = json['name'] as String?
      ..images =
          (json['images'] as List<dynamic>?)?.map((e) => e as String).toList()
      ..thumbnail = json['thumbnail'] as String?
      ..description = json['description'] as String?
      ..parentId = json['parent_id'] as String?
      ..restaurantId = json['restaurant_id'] as String?
      ..createdBy = json['created_by'] as String?
      ..children = (json['children'] as List<dynamic>?)
          ?.map((e) => MenuRestaurantModel.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$MenuRestaurantModelToJson(
        MenuRestaurantModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'is_deleted': instance.isDeleted,
      'deleted_at': instance.deletedAt,
      'path': instance.path,
      'name': instance.name,
      'images': instance.images,
      'thumbnail': instance.thumbnail,
      'description': instance.description,
      'parent_id': instance.parentId,
      'restaurant_id': instance.restaurantId,
      'created_by': instance.createdBy,
      'children': instance.children,
    };
