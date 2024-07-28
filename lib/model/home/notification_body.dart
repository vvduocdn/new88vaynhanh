import 'package:json_annotation/json_annotation.dart';

part 'notification_body.g.dart';

@JsonSerializable()
class NotificationBody {
  @JsonKey(name: 'limit')
  int? limit;

  @JsonKey(name: 'page')
  int? page;

  NotificationBody();

  factory NotificationBody.fromJson(Map<String, dynamic> json) =>
      _$NotificationBodyFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationBodyToJson(this);
}
