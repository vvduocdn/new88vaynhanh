import 'package:json_annotation/json_annotation.dart';
import 'package:new88_vaynow/model/home/product_model.dart';

part 'history_order_model.g.dart';

@JsonSerializable()
class HistoryOrderAddressResponse {
  @JsonKey(name: 'total')
  int? total;
  @JsonKey(name: 'records')
  List<HistoryOrderModel>? records;

  HistoryOrderAddressResponse();

  factory HistoryOrderAddressResponse.fromJson(Map<String, dynamic> json) =>
      _$HistoryOrderAddressResponseFromJson(json);

  Map<String, dynamic> toJson() => _$HistoryOrderAddressResponseToJson(this);
}

@JsonSerializable()
class HistoryOrderModel {
  @JsonKey(name: 'id')
  String? id;
  @JsonKey(name: 'created_at')
  DateTime? createdAt;
  @JsonKey(name: 'updated_at')
  DateTime? updatedAt;
  @JsonKey(name: 'is_deleted')
  bool? isDeleted;
  @JsonKey(name: 'deleted_at')
  DateTime? deletedAt;
  @JsonKey(name: 'status')
  String? status;
  @JsonKey(name: 'order_number')
  String? orderNumber;
  @JsonKey(name: 'recipient')
  String? recipient;
  @JsonKey(name: 'phone')
  String? phone;
  @JsonKey(name: 'email')
  String? email;
  @JsonKey(name: 'description')
  String? description;
  @JsonKey(name: 'message_from_restaurant')
  String? messageFromRestaurant;
  @JsonKey(name: 'total_bill')
  double? totalBill;
  @JsonKey(name: 'deliver_method')
  String? deliverMethod;
  @JsonKey(name: 'waiting_time')
  int? waitingTime;
  @JsonKey(name: 'desired_delivery_time')
  DateTime? desiredDeliveryTime;
  @JsonKey(name: 'restaurant_id')
  String? restaurantId;
  @JsonKey(name: 'created_by')
  String? createdBy;
  @JsonKey(name: 'restaurant')
  HistoryRestaurant? restaurant;
  @JsonKey(name: 'order_address')
  HistoryOrderAddress? orderAddress;
  @JsonKey(name: 'order_details')
  List<HistoryOrderDetail>? orderDetails;

  HistoryOrderModel();

  factory HistoryOrderModel.fromJson(Map<String, dynamic> json) =>
      _$HistoryOrderModelFromJson(json);

  Map<String, dynamic> toJson() => _$HistoryOrderModelToJson(this);
}

@JsonSerializable()
class HistoryRestaurant {
  @JsonKey(name: 'id')
  String? id;
  @JsonKey(name: 'created_at')
  DateTime? createdAt;
  @JsonKey(name: 'updated_at')
  DateTime? updatedAt;
  @JsonKey(name: 'is_deleted')
  bool? isDeleted;
  @JsonKey(name: 'deleted_at')
  DateTime? deletedAt;
  @JsonKey(name: 'status')
  String? status;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'currency')
  String? currency;
  @JsonKey(name: 'currency_symbol')
  String? currencySymbol;
  @JsonKey(name: 'thumbnail')
  String? thumbnail;
  @JsonKey(name: 'description')
  String? description;
  @JsonKey(name: 'email')
  String? email;
  @JsonKey(name: 'phoneNumber')
  String? phoneNumber;
  @JsonKey(name: 'address')
  String? address;
  @JsonKey(name: 'announcement')
  String? announcement;
  @JsonKey(name: 'closingNotice')
  String? closingNotice;
  @JsonKey(name: 'timezone')
  int? timezone;
  @JsonKey(name: 'createdBy')
  String? createdBy;

  HistoryRestaurant();

  factory HistoryRestaurant.fromJson(Map<String, dynamic> json) =>
      _$HistoryRestaurantFromJson(json);

  Map<String, dynamic> toJson() => _$HistoryRestaurantToJson(this);
}

@JsonSerializable()
class HistoryOrderDetail {
  String? id;
  @JsonKey(name: 'created_at')
  DateTime? createdAt;
  @JsonKey(name: 'updated_at')
  DateTime? updatedAt;
  @JsonKey(name: 'is_deleted')
  bool? isDeleted;
  @JsonKey(name: 'deleted_at')
  DateTime? deletedAt;
  String? name;
  String? thumbnail;
  double? price;
  int? quantity;
  double? total;
  String? note;
  List<OptionsProduct>? options;
  String? menu;
  @JsonKey(name: 'order_id')
  String? orderId;

  HistoryOrderDetail();

  factory HistoryOrderDetail.fromJson(Map<String, dynamic> json) =>
      _$HistoryOrderDetailFromJson(json);

  Map<String, dynamic> toJson() => _$HistoryOrderDetailToJson(this);
}

@JsonSerializable()
class HistoryOrderAddress {
  @JsonKey(name: 'address')
  String? address;
  @JsonKey(name: 'city')
  String? city;
  @JsonKey(name: 'country')
  String? country;
  @JsonKey(name: 'zip_code')
  String? zipCode;
  @JsonKey(name: 'address_detail')
  String? addressDetail;

  HistoryOrderAddress();

  factory HistoryOrderAddress.fromJson(Map<String, dynamic> json) =>
      _$HistoryOrderAddressFromJson(json);

  Map<String, dynamic> toJson() => _$HistoryOrderAddressToJson(this);
}
