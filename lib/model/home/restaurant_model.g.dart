// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restaurant_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RestaurantModelResponse _$RestaurantModelResponseFromJson(
        Map<String, dynamic> json) =>
    RestaurantModelResponse()
      ..total = (json['total'] as num?)?.toInt()
      ..records = (json['records'] as List<dynamic>?)
          ?.map((e) => RestaurantModelData.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$RestaurantModelResponseToJson(
        RestaurantModelResponse instance) =>
    <String, dynamic>{
      'total': instance.total,
      'records': instance.records,
    };

RestaurantModelData _$RestaurantModelDataFromJson(Map<String, dynamic> json) =>
    RestaurantModelData()
      ..id = json['id'] as String?
      ..createdAt = json['created_at'] as String?
      ..updatedAt = json['updated_at'] as String?
      ..isDeleted = json['is_deleted'] as bool?
      ..deletedAt = json['deleted_at'] as bool?
      ..status = json['status'] as String?
      ..name = json['name'] as String?
      ..currency = json['currency'] as String?
      ..currencySymbol = json['currency_symbol'] as String?
      ..thumbnail = json['thumbnail'] as String?
      ..description = json['description'] as String?
      ..email = json['email'] as String?
      ..phoneNumber = json['phoneNumber'] as String?
      ..address = json['address'] as String?
      ..announcement = json['announcement'] as String?
      ..closingNotice = json['closing_notice'] as String?
      ..timezone = (json['timezone'] as num?)?.toInt()
      ..rating = (json['rating'] as num?)?.toDouble()
      ..createdBy = json['created_by'] as String?
      ..webUrl = json['web_url'] as String?
      ..operatingTimes = (json['operating_times'] as List<dynamic>?)
          ?.map((e) => OperatingTimesModel.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$RestaurantModelDataToJson(
        RestaurantModelData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'is_deleted': instance.isDeleted,
      'deleted_at': instance.deletedAt,
      'status': instance.status,
      'name': instance.name,
      'currency': instance.currency,
      'currency_symbol': instance.currencySymbol,
      'thumbnail': instance.thumbnail,
      'description': instance.description,
      'email': instance.email,
      'phoneNumber': instance.phoneNumber,
      'address': instance.address,
      'announcement': instance.announcement,
      'closing_notice': instance.closingNotice,
      'timezone': instance.timezone,
      'rating': instance.rating,
      'created_by': instance.createdBy,
      'web_url': instance.webUrl,
      'operating_times': instance.operatingTimes,
    };

OperatingTimesModel _$OperatingTimesModelFromJson(Map<String, dynamic> json) =>
    OperatingTimesModel()
      ..morning = json['morning'] as String?
      ..afternoon = json['afternoon'] as String?
      ..dayOfWeek = json['day_of_week'] as String?;

Map<String, dynamic> _$OperatingTimesModelToJson(
        OperatingTimesModel instance) =>
    <String, dynamic>{
      'morning': instance.morning,
      'afternoon': instance.afternoon,
      'day_of_week': instance.dayOfWeek,
    };
