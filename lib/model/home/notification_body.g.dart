// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationBody _$NotificationBodyFromJson(Map<String, dynamic> json) =>
    NotificationBody()
      ..limit = (json['limit'] as num?)?.toInt()
      ..page = (json['page'] as num?)?.toInt();

Map<String, dynamic> _$NotificationBodyToJson(NotificationBody instance) =>
    <String, dynamic>{
      'limit': instance.limit,
      'page': instance.page,
    };
