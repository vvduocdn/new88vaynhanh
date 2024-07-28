import 'package:hive_flutter/hive_flutter.dart';

part 'order_address_hive.g.dart';

@HiveType(typeId: 4)
class OrderAddressHive extends HiveObject {
  @HiveField(0)
  String? address;

  @HiveField(1)
  String? city;

  @HiveField(2)
  String? country;

  @HiveField(3)
  String? zipCode;

  @HiveField(4)
  String? addressDetail;

  @HiveField(5)
  String? phone;

  @HiveField(6)
  String? name;

  @HiveField(7)
  String? id;

  OrderAddressHive({
    this.address,
    this.city,
    this.country,
    this.zipCode,
    this.addressDetail,
    this.phone,
    this.name,
    this.id,
  });

  // From JSON
  factory OrderAddressHive.fromJson(Map<String, dynamic> json) {
    return OrderAddressHive(
      address: json['address'] as String?,
      city: json['city'] as String?,
      country: json['country'] as String?,
      zipCode: json['zipCode'] as String?,
      addressDetail: json['addressDetail'] as String?,
      phone: json['phone_number'] as String?,
      name: json['name'] as String?,
      id: json['id'] as String?,
    );
  }

  // To JSON
  Map<String, dynamic> toJson() {
    return {
      'address': address,
      'city': city,
      'country': country,
      'zipCode': zipCode,
      'addressDetail': addressDetail,
      'phone_number': phone,
      'name': name,
      'id': id,
    };
  }

  // To String
  @override
  String toString() {
    return 'OrderAddress(address: $address, city: $city, country: $country, zipCode: $zipCode, addressDetail: $addressDetail,id: $id)';
  }
}
