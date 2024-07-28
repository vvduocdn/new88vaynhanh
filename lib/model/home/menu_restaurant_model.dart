import 'package:json_annotation/json_annotation.dart';

part 'menu_restaurant_model.g.dart';

@JsonSerializable()
class MenuRestaurantModel {
  @JsonKey(name: 'id')
  String? id;

  @JsonKey(name: 'created_at')
  String? createdAt;

  @JsonKey(name: 'updated_at')
  String? updatedAt;

  @JsonKey(name: 'is_deleted')
  bool? isDeleted;

  @JsonKey(name: 'deleted_at')
  bool? deletedAt;

  @JsonKey(name: 'path')
  String? path;

  @JsonKey(name: 'name')
  String? name;

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

  @JsonKey(name: 'children')
  List<MenuRestaurantModel>? children;

  MenuRestaurantModel();

  factory MenuRestaurantModel.fromJson(Map<String, dynamic> json) =>
      _$MenuRestaurantModelFromJson(json);

  Map<String, dynamic> toJson() => _$MenuRestaurantModelToJson(this);
}
