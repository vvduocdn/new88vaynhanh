import 'package:json_annotation/json_annotation.dart';

part 'banner_model.g.dart';

@JsonSerializable()
class BannerModel {
  @JsonKey(name: 'id')
  String? id;

  @JsonKey(name: 'status')
  String? status;

  @JsonKey(name: 'url')
  String? url;

  @JsonKey(name: 'image')
  String? image;
  BannerModel();

  factory BannerModel.fromJson(Map<String, dynamic> json) =>
      _$BannerModelFromJson(json);

  Map<String, dynamic> toJson() => _$BannerModelToJson(this);
}
