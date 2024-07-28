import 'package:json_annotation/json_annotation.dart';

part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse {
  @JsonKey(name: 'access_token')
  String? accessToken;

  @JsonKey(name: 'user_id')
  String? userId;

  @JsonKey(name: 'status')
  String? status;

  @JsonKey(name: 'expire_at')
  String? expireAt;

  @JsonKey(name: 'user_info')
  UserResponse? userInfo;
  LoginResponse();

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}

@JsonSerializable()
class UserResponse {
  @JsonKey(name: 'id')
  String? id;

  @JsonKey(name: 'created_at')
  String? createdAt;

  @JsonKey(name: 'updated_at')
  String? updatedAt;

  @JsonKey(name: 'full_name')
  String? fullName;

  @JsonKey(name: 'email')
  String? email;

  @JsonKey(name: 'avatar')
  String? avatar;

  @JsonKey(name: 'phone_number')
  String? phone;

  @JsonKey(name: 'status')
  String? status;

  UserResponse();

  factory UserResponse.fromJson(Map<String, dynamic> json) =>
      _$UserResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UserResponseToJson(this);
}

@JsonSerializable()
class RoleResponse {
  @JsonKey(name: 'id')
  String? id;

  @JsonKey(name: 'created_at')
  String? createdAt;

  @JsonKey(name: 'updated_at')
  String? updatedAt;

  @JsonKey(name: 'is_deleted')
  bool? isDeleted;

  @JsonKey(name: 'user_id')
  String? userId;

  @JsonKey(name: 'role_name')
  String? roleName;

  @JsonKey(name: 'status')
  bool? status;

  RoleResponse();

  factory RoleResponse.fromJson(Map<String, dynamic> json) =>
      _$RoleResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RoleResponseToJson(this);
}
