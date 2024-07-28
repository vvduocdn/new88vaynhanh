import 'package:json_annotation/json_annotation.dart';

part 'product_body.g.dart';

@JsonSerializable()
class ProductBody {
  @JsonKey(name: 'limit')
  int? limit;

  @JsonKey(name: 'page')
  int? page;

  @JsonKey(name: 'sort_by')
  String? sortBy;

  ProductBody();

  factory ProductBody.fromJson(Map<String, dynamic> json) =>
      _$ProductBodyFromJson(json);

  Map<String, dynamic> toJson() => _$ProductBodyToJson(this);
}
