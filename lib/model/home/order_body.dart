import 'package:json_annotation/json_annotation.dart';
import 'package:new88_vaynow/model/home/order_address_body.dart';

part 'order_body.g.dart';

@JsonSerializable()
class OrderBody {
  @JsonKey(name: 'recipient')
  String? recipient;

  @JsonKey(name: 'phone')
  String? phone;

  @JsonKey(name: 'email')
  String? email;

  @JsonKey(name: 'description')
  String? description;

  @JsonKey(name: 'deliver_method')
  String? deliverMethod;

  @JsonKey(name: 'order_address')
  OrderAddressBody? addressData;

  @JsonKey(name: 'cart_id')
  String? cartId;
  @JsonKey(name: 'desired_delivery_time')
  String? desiredDeliveryTime;
  @JsonKey(name: 'env')
  String? env;
  OrderBody();

  factory OrderBody.fromJson(Map<String, dynamic> json) =>
      _$OrderBodyFromJson(json);

  Map<String, dynamic> toJson() => _$OrderBodyToJson(this);
}
