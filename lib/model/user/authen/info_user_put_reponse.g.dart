// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'info_user_put_reponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InfoUserPutResponse _$InfoUserPutResponseFromJson(Map<String, dynamic> json) =>
    InfoUserPutResponse()
      ..updatedTime = (json['updatedTime'] as num?)?.toInt()
      ..fullName = json['fullName'] as String?
      ..phoneNumber = json['phoneNumber'] as String?
      ..id = json['_id'] as String?;

Map<String, dynamic> _$InfoUserPutResponseToJson(
        InfoUserPutResponse instance) =>
    <String, dynamic>{
      'updatedTime': instance.updatedTime,
      'fullName': instance.fullName,
      'phoneNumber': instance.phoneNumber,
      '_id': instance.id,
    };
