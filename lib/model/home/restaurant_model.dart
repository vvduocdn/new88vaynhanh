import 'package:json_annotation/json_annotation.dart';

part 'restaurant_model.g.dart';

@JsonSerializable()
class RestaurantModelResponse {
  @JsonKey(name: 'total')
  int? total;

  @JsonKey(name: 'records')
  List<RestaurantModelData>? records;

  RestaurantModelResponse();

  factory RestaurantModelResponse.fromJson(Map<String, dynamic> json) =>
      _$RestaurantModelResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RestaurantModelResponseToJson(this);
}

@JsonSerializable()
class RestaurantModelData {
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

  @JsonKey(name: 'status')
  String? status;

  @JsonKey(name: 'name')
  String? name;

  @JsonKey(name: 'currency')
  String? currency;

  @JsonKey(name: 'currency_symbol')
  String? currencySymbol;

  @JsonKey(name: 'thumbnail')
  String? thumbnail;

  @JsonKey(name: 'description')
  String? description;

  @JsonKey(name: 'email')
  String? email;

  @JsonKey(name: 'phoneNumber')
  String? phoneNumber;

  @JsonKey(name: 'address')
  String? address;

  @JsonKey(name: 'announcement')
  String? announcement;

  @JsonKey(name: 'closing_notice')
  String? closingNotice;

  @JsonKey(name: 'timezone')
  int? timezone;

  @JsonKey(name: 'rating')
  double? rating;

  @JsonKey(name: 'created_by')
  String? createdBy;

  @JsonKey(name: 'web_url')
  String? webUrl;
  @JsonKey(name: 'operating_times')
  List<OperatingTimesModel>? operatingTimes;

  RestaurantModelData();

  factory RestaurantModelData.fromJson(Map<String, dynamic> json) =>
      _$RestaurantModelDataFromJson(json);

  Map<String, dynamic> toJson() => _$RestaurantModelDataToJson(this);
}

@JsonSerializable()
class OperatingTimesModel {
  @JsonKey(name: 'morning')
  String? morning;

  @JsonKey(name: 'afternoon')
  String? afternoon;
  @JsonKey(name: 'day_of_week')
  String? dayOfWeek;
  OperatingTimesModel();

  factory OperatingTimesModel.fromJson(Map<String, dynamic> json) =>
      _$OperatingTimesModelFromJson(json);

  Map<String, dynamic> toJson() => _$OperatingTimesModelToJson(this);
}
