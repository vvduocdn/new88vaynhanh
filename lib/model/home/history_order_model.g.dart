// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HistoryOrderAddressResponse _$HistoryOrderAddressResponseFromJson(
        Map<String, dynamic> json) =>
    HistoryOrderAddressResponse()
      ..total = (json['total'] as num?)?.toInt()
      ..records = (json['records'] as List<dynamic>?)
          ?.map((e) => HistoryOrderModel.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$HistoryOrderAddressResponseToJson(
        HistoryOrderAddressResponse instance) =>
    <String, dynamic>{
      'total': instance.total,
      'records': instance.records,
    };

HistoryOrderModel _$HistoryOrderModelFromJson(Map<String, dynamic> json) =>
    HistoryOrderModel()
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
      ..orderNumber = json['order_number'] as String?
      ..recipient = json['recipient'] as String?
      ..phone = json['phone'] as String?
      ..email = json['email'] as String?
      ..description = json['description'] as String?
      ..messageFromRestaurant = json['message_from_restaurant'] as String?
      ..totalBill = (json['total_bill'] as num?)?.toDouble()
      ..deliverMethod = json['deliver_method'] as String?
      ..waitingTime = (json['waiting_time'] as num?)?.toInt()
      ..desiredDeliveryTime = json['desired_delivery_time'] == null
          ? null
          : DateTime.parse(json['desired_delivery_time'] as String)
      ..restaurantId = json['restaurant_id'] as String?
      ..createdBy = json['created_by'] as String?
      ..restaurant = json['restaurant'] == null
          ? null
          : HistoryRestaurant.fromJson(
              json['restaurant'] as Map<String, dynamic>)
      ..orderAddress = json['order_address'] == null
          ? null
          : HistoryOrderAddress.fromJson(
              json['order_address'] as Map<String, dynamic>)
      ..orderDetails = (json['order_details'] as List<dynamic>?)
          ?.map((e) => HistoryOrderDetail.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$HistoryOrderModelToJson(HistoryOrderModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'is_deleted': instance.isDeleted,
      'deleted_at': instance.deletedAt?.toIso8601String(),
      'status': instance.status,
      'order_number': instance.orderNumber,
      'recipient': instance.recipient,
      'phone': instance.phone,
      'email': instance.email,
      'description': instance.description,
      'message_from_restaurant': instance.messageFromRestaurant,
      'total_bill': instance.totalBill,
      'deliver_method': instance.deliverMethod,
      'waiting_time': instance.waitingTime,
      'desired_delivery_time': instance.desiredDeliveryTime?.toIso8601String(),
      'restaurant_id': instance.restaurantId,
      'created_by': instance.createdBy,
      'restaurant': instance.restaurant,
      'order_address': instance.orderAddress,
      'order_details': instance.orderDetails,
    };

HistoryRestaurant _$HistoryRestaurantFromJson(Map<String, dynamic> json) =>
    HistoryRestaurant()
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
      ..currency = json['currency'] as String?
      ..currencySymbol = json['currency_symbol'] as String?
      ..thumbnail = json['thumbnail'] as String?
      ..description = json['description'] as String?
      ..email = json['email'] as String?
      ..phoneNumber = json['phoneNumber'] as String?
      ..address = json['address'] as String?
      ..announcement = json['announcement'] as String?
      ..closingNotice = json['closingNotice'] as String?
      ..timezone = (json['timezone'] as num?)?.toInt()
      ..createdBy = json['createdBy'] as String?;

Map<String, dynamic> _$HistoryRestaurantToJson(HistoryRestaurant instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'is_deleted': instance.isDeleted,
      'deleted_at': instance.deletedAt?.toIso8601String(),
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
      'closingNotice': instance.closingNotice,
      'timezone': instance.timezone,
      'createdBy': instance.createdBy,
    };

HistoryOrderDetail _$HistoryOrderDetailFromJson(Map<String, dynamic> json) =>
    HistoryOrderDetail()
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
      ..thumbnail = json['thumbnail'] as String?
      ..price = (json['price'] as num?)?.toDouble()
      ..quantity = (json['quantity'] as num?)?.toInt()
      ..total = (json['total'] as num?)?.toDouble()
      ..note = json['note'] as String?
      ..options = (json['options'] as List<dynamic>?)
          ?.map((e) => OptionsProduct.fromJson(e as Map<String, dynamic>))
          .toList()
      ..menu = json['menu'] as String?
      ..orderId = json['order_id'] as String?;

Map<String, dynamic> _$HistoryOrderDetailToJson(HistoryOrderDetail instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'is_deleted': instance.isDeleted,
      'deleted_at': instance.deletedAt?.toIso8601String(),
      'name': instance.name,
      'thumbnail': instance.thumbnail,
      'price': instance.price,
      'quantity': instance.quantity,
      'total': instance.total,
      'note': instance.note,
      'options': instance.options,
      'menu': instance.menu,
      'order_id': instance.orderId,
    };

HistoryOrderAddress _$HistoryOrderAddressFromJson(Map<String, dynamic> json) =>
    HistoryOrderAddress()
      ..address = json['address'] as String?
      ..city = json['city'] as String?
      ..country = json['country'] as String?
      ..zipCode = json['zip_code'] as String?
      ..addressDetail = json['address_detail'] as String?;

Map<String, dynamic> _$HistoryOrderAddressToJson(
        HistoryOrderAddress instance) =>
    <String, dynamic>{
      'address': instance.address,
      'city': instance.city,
      'country': instance.country,
      'zip_code': instance.zipCode,
      'address_detail': instance.addressDetail,
    };
