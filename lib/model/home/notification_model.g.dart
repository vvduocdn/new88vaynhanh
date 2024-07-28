// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationResponse _$NotificationResponseFromJson(
        Map<String, dynamic> json) =>
    NotificationResponse()
      ..total = (json['total'] as num?)?.toInt()
      ..records = (json['records'] as List<dynamic>?)
          ?.map((e) => NotificationModel.fromJson(e as Map<String, dynamic>))
          .toList()
      ..hasNew = json['hasNew'] as bool?;

Map<String, dynamic> _$NotificationResponseToJson(
        NotificationResponse instance) =>
    <String, dynamic>{
      'total': instance.total,
      'records': instance.records,
      'hasNew': instance.hasNew,
    };

NotificationModel _$NotificationModelFromJson(Map<String, dynamic> json) =>
    NotificationModel()
      ..id = json['id'] as String?
      ..status = json['status'] as String?
      ..title = json['title'] as String?
      ..msg = json['msg'] as String?
      ..type = json['type'] as String?
      ..createdAt = json['created_at'] as String?;

Map<String, dynamic> _$NotificationModelToJson(NotificationModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'status': instance.status,
      'title': instance.title,
      'msg': instance.msg,
      'type': instance.type,
      'created_at': instance.createdAt,
    };
