import 'package:json_annotation/json_annotation.dart';

part 'order_address_body.g.dart';

@JsonSerializable()
class OrderAddressBody {
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
  OrderAddressBody();

  factory OrderAddressBody.fromJson(Map<String, dynamic> json) =>
      _$OrderAddressBodyFromJson(json);

  Map<String, dynamic> toJson() => _$OrderAddressBodyToJson(this);
}
