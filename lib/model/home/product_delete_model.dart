import 'package:json_annotation/json_annotation.dart';

part 'product_delete_model.g.dart';

@JsonSerializable()
class ProductDeleteModel {
  @JsonKey(name: 'product_id')
  String? productId;
  ProductDeleteModel();

  factory ProductDeleteModel.fromJson(Map<String, dynamic> json) =>
      _$ProductDeleteModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductDeleteModelToJson(this);
}
