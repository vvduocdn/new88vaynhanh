import 'package:json_annotation/json_annotation.dart';

part 'order_address_model.g.dart';

@JsonSerializable()
class OrderAddressModel {
  @JsonKey(name: 'id')
  String? id;

  @JsonKey(name: 'phone_number')
  String? phoneNumber;

  @JsonKey(name: 'name')
  String? name;

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
  OrderAddressModel();

  factory OrderAddressModel.fromJson(Map<String, dynamic> json) =>
      _$OrderAddressModelFromJson(json);

  Map<String, dynamic> toJson() => _$OrderAddressModelToJson(this);
}
