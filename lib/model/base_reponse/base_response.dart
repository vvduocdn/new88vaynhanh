import 'package:json_annotation/json_annotation.dart';

part 'base_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class BaseResponse<T> {
  @JsonKey(name: 'data')
  T? data;

  @JsonKey(name: 'success', defaultValue: false)
  bool? success;

  @JsonKey(name: 'error_code')
  int? message;

  BaseResponse();

  factory BaseResponse.fromJson(Map<String, dynamic> json, T Function(Object? json) fromJsonT) => _$BaseResponseFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Object Function(T value) toJsonT) => _$BaseResponseToJson(this, toJsonT);
}
