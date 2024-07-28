// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) =>
    LoginResponse()
      ..accessToken = json['access_token'] as String?
      ..userId = json['user_id'] as String?
      ..status = json['status'] as String?
      ..expireAt = json['expire_at'] as String?
      ..userInfo = json['user_info'] == null
          ? null
          : UserResponse.fromJson(json['user_info'] as Map<String, dynamic>);

Map<String, dynamic> _$LoginResponseToJson(LoginResponse instance) =>
    <String, dynamic>{
      'access_token': instance.accessToken,
      'user_id': instance.userId,
      'status': instance.status,
      'expire_at': instance.expireAt,
      'user_info': instance.userInfo,
    };

UserResponse _$UserResponseFromJson(Map<String, dynamic> json) => UserResponse()
  ..id = json['id'] as String?
  ..createdAt = json['created_at'] as String?
  ..updatedAt = json['updated_at'] as String?
  ..fullName = json['full_name'] as String?
  ..email = json['email'] as String?
  ..avatar = json['avatar'] as String?
  ..phone = json['phone_number'] as String?
  ..status = json['status'] as String?;

Map<String, dynamic> _$UserResponseToJson(UserResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'full_name': instance.fullName,
      'email': instance.email,
      'avatar': instance.avatar,
      'phone_number': instance.phone,
      'status': instance.status,
    };

RoleResponse _$RoleResponseFromJson(Map<String, dynamic> json) => RoleResponse()
  ..id = json['id'] as String?
  ..createdAt = json['created_at'] as String?
  ..updatedAt = json['updated_at'] as String?
  ..isDeleted = json['is_deleted'] as bool?
  ..userId = json['user_id'] as String?
  ..roleName = json['role_name'] as String?
  ..status = json['status'] as bool?;

Map<String, dynamic> _$RoleResponseToJson(RoleResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'is_deleted': instance.isDeleted,
      'user_id': instance.userId,
      'role_name': instance.roleName,
      'status': instance.status,
    };
