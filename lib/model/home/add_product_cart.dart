import 'package:json_annotation/json_annotation.dart';

part 'add_product_cart.g.dart';

@JsonSerializable()
class AddProductCart {
  @JsonKey(name: 'product_id')
  String? productId;

  @JsonKey(name: 'note')
  String? note;

  @JsonKey(name: 'options')
  List<String>? options;

  AddProductCart();

  factory AddProductCart.fromJson(Map<String, dynamic> json) =>
      _$AddProductCartFromJson(json);

  Map<String, dynamic> toJson() => _$AddProductCartToJson(this);
}
