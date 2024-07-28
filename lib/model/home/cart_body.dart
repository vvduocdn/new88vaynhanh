import 'package:json_annotation/json_annotation.dart';

part 'cart_body.g.dart';

@JsonSerializable()
class CartBody {
  @JsonKey(name: 'product_id')
  String? productId;

  @JsonKey(name: 'quantity')
  int? quantity;

  @JsonKey(name: 'note')
  String? note;

  @JsonKey(name: 'options')
  List<String>? options;
  CartBody();

  factory CartBody.fromJson(Map<String, dynamic> json) =>
      _$CartBodyFromJson(json);

  Map<String, dynamic> toJson() => _$CartBodyToJson(this);
}
