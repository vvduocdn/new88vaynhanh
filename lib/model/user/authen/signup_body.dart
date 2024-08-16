import 'package:json_annotation/json_annotation.dart';

part 'signup_body.g.dart';

@JsonSerializable()
class SignupBody {
  @JsonKey(name: 'email')
  String? email;

  @JsonKey(name: 'password')
  String? password;

  @JsonKey(name: 'full_name')
  String? fullName;

  @JsonKey(name: 'phone_number')
  String? phoneNumber;
  SignupBody();

  factory SignupBody.fromJson(Map<String, dynamic> json) => _$SignupBodyFromJson(json);

  Map<String, dynamic> toJson() => _$SignupBodyToJson(this);
}
