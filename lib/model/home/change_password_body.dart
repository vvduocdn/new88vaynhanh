import 'package:json_annotation/json_annotation.dart';

part 'change_password_body.g.dart';

@JsonSerializable()
class ChangePasswordBody {
  @JsonKey(name: 'old_password')
  String? oldPassword;

  @JsonKey(name: 'new_password')
  String? newPassword;

  ChangePasswordBody();

  factory ChangePasswordBody.fromJson(Map<String, dynamic> json) =>
      _$ChangePasswordBodyFromJson(json);

  Map<String, dynamic> toJson() => _$ChangePasswordBodyToJson(this);
}
