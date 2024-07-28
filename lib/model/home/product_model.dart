import 'package:json_annotation/json_annotation.dart';

part 'product_model.g.dart';

@JsonSerializable()
class ProductModelResponse {
  @JsonKey(name: 'total')
  int? total;

  @JsonKey(name: 'records')
  List<ProductModel>? records;

  ProductModelResponse();

  factory ProductModelResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductModelResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ProductModelResponseToJson(this);
}

@JsonSerializable()
class ProductModel {
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

  @JsonKey(name: 'price')
  double? price;

  @JsonKey(name: 'quantity')
  int? quantity;

  @JsonKey(name: 'thumbnail')
  String? thumbnail;

  @JsonKey(name: 'description')
  String? description;

  @JsonKey(name: 'images')
  List<String>? images;

  @JsonKey(name: 'ingredient')
  List<String>? ingredient;

  @JsonKey(name: 'menu_id')
  String? menuId;

  @JsonKey(name: 'restaurant_id')
  String? restaurantId;

  @JsonKey(name: 'created_by')
  String? createdBy;

  @JsonKey(name: 'menu')
  Menu? menu;

  @JsonKey(name: 'options')
  List<OptionsProduct>? options;

  ProductModel();

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductModelToJson(this);
}

@JsonSerializable()
class Menu {
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

  @JsonKey(name: 'name')
  String? name;

  @JsonKey(name: 'path')
  String? path;

  @JsonKey(name: 'images')
  List<String>? images;

  @JsonKey(name: 'thumbnail')
  String? thumbnail;

  @JsonKey(name: 'description')
  String? description;

  @JsonKey(name: 'parent_id')
  String? parentId;

  @JsonKey(name: 'restaurant_id')
  String? restaurantId;

  @JsonKey(name: 'created_by')
  String? createdBy;

  Menu();

  factory Menu.fromJson(Map<String, dynamic> json) => _$MenuFromJson(json);

  Map<String, dynamic> toJson() => _$MenuToJson(this);
}

@JsonSerializable()
class OptionsProduct {
  @JsonKey(name: 'id')
  String? id;

  @JsonKey(name: 'name')
  String? name;

  @JsonKey(name: 'price')
  double? price;

  OptionsProduct();

  factory OptionsProduct.fromJson(Map<String, dynamic> json) =>
      _$OptionsProductFromJson(json);

  Map<String, dynamic> toJson() => _$OptionsProductToJson(this);
}
