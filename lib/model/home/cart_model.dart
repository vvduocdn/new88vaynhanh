import 'package:json_annotation/json_annotation.dart';
import 'package:new88_vaynow/model/home/product_model.dart';

part 'cart_model.g.dart';

@JsonSerializable()
class CartModel {
  @JsonKey(name: 'id')
  String? id;
  @JsonKey(name: 'created_at')
  String? createdAt;
  @JsonKey(name: 'updated_at')
  String? updatedAt;
  @JsonKey(name: 'is_deleted')
  bool? isDeleted;
  @JsonKey(name: 'deleted_at')
  String? deletedAt;
  @JsonKey(name: 'created_by')
  String? createdBy;
  @JsonKey(name: 'restaurant_id')
  String? restaurantId;
  List<ProductCartModel>? products;
  @JsonKey(name: 'total_price')
  double? totalPrice;

  CartModel();

  factory CartModel.fromJson(Map<String, dynamic> json) =>
      _$CartModelFromJson(json);

  Map<String, dynamic> toJson() => _$CartModelToJson(this);
}

@JsonSerializable()
class ProductCartModel {
  @JsonKey(name: 'id')
  String? id;

  @JsonKey(name: 'name')
  String? name;

  @JsonKey(name: 'price')
  double? price;

  @JsonKey(name: 'quantity')
  int? quantity;

  @JsonKey(name: 'thumbnail')
  String? thumbnail;

  @JsonKey(name: 'total')
  double? total;

  @JsonKey(name: 'note')
  String? note;

  @JsonKey(name: 'options')
  List<OptionsProductResponse>? options;

  ProductCartModel();

  factory ProductCartModel.fromJson(Map<String, dynamic> json) =>
      _$ProductCartModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductCartModelToJson(this);
}

@JsonSerializable()
class OptionsProductResponse {
  @JsonKey(name: 'id')
  String? id;

  @JsonKey(name: 'name')
  String? name;

  @JsonKey(name: 'price')
  double? price;

  OptionsProductResponse();

  factory OptionsProductResponse.fromJson(Map<String, dynamic> json) =>
      _$OptionsProductResponseFromJson(json);

  Map<String, dynamic> toJson() => _$OptionsProductResponseToJson(this);
}
