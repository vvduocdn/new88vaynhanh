// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'banner_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BannerModel _$BannerModelFromJson(Map<String, dynamic> json) => BannerModel()
  ..id = json['id'] as String?
  ..status = json['status'] as String?
  ..url = json['url'] as String?
  ..image = json['image'] as String?;

Map<String, dynamic> _$BannerModelToJson(BannerModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'status': instance.status,
      'url': instance.url,
      'image': instance.image,
    };
