// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductBody _$ProductBodyFromJson(Map<String, dynamic> json) => ProductBody()
  ..limit = (json['limit'] as num?)?.toInt()
  ..page = (json['page'] as num?)?.toInt()
  ..sortBy = json['sort_by'] as String?;

Map<String, dynamic> _$ProductBodyToJson(ProductBody instance) =>
    <String, dynamic>{
      'limit': instance.limit,
      'page': instance.page,
      'sort_by': instance.sortBy,
    };
