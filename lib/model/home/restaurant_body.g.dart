// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restaurant_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RestaurantBody _$RestaurantBodyFromJson(Map<String, dynamic> json) =>
    RestaurantBody()
      ..limit = (json['limit'] as num?)?.toInt()
      ..page = (json['page'] as num?)?.toInt()
      ..sortBy = json['sort_by'] as String?;

Map<String, dynamic> _$RestaurantBodyToJson(RestaurantBody instance) =>
    <String, dynamic>{
      'limit': instance.limit,
      'page': instance.page,
      'sort_by': instance.sortBy,
    };
