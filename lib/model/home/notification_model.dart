import 'package:json_annotation/json_annotation.dart';

part 'notification_model.g.dart';

@JsonSerializable()
class NotificationResponse {
  @JsonKey(name: 'total')
  int? total;

  @JsonKey(name: 'records')
  List<NotificationModel>? records;

  @JsonKey(name: 'hasNew')
  bool? hasNew;

  NotificationResponse();

  factory NotificationResponse.fromJson(Map<String, dynamic> json) =>
      _$NotificationResponseFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationResponseToJson(this);
}

@JsonSerializable()
class NotificationModel {
  @JsonKey(name: 'id')
  String? id;

  @JsonKey(name: 'status')
  String? status;

  @JsonKey(name: 'title')
  String? title;

  @JsonKey(name: 'msg')
  String? msg;

  @JsonKey(name: 'type')
  String? type;

  @JsonKey(name: 'created_at')
  String? createdAt;
  NotificationModel();

  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      _$NotificationModelFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationModelToJson(this);
}
