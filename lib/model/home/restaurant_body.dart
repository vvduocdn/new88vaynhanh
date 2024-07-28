import 'package:json_annotation/json_annotation.dart';

part 'restaurant_body.g.dart';

@JsonSerializable()
class RestaurantBody {
  @JsonKey(name: 'limit')
  int? limit;

  @JsonKey(name: 'page')
  int? page;

  @JsonKey(name: 'sort_by')
  String? sortBy;

  RestaurantBody();

  factory RestaurantBody.fromJson(Map<String, dynamic> json) =>
      _$RestaurantBodyFromJson(json);

  Map<String, dynamic> toJson() => _$RestaurantBodyToJson(this);
}
