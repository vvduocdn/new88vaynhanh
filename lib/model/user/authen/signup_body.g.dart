// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignupBody _$SignupBodyFromJson(Map<String, dynamic> json) => SignupBody()
  ..email = json['email'] as String?
  ..password = json['password'] as String?
  ..fullName = json['full_name'] as String?
  ..phoneNumber = json['phone_number'] as String?;

Map<String, dynamic> _$SignupBodyToJson(SignupBody instance) => <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
      'full_name': instance.fullName,
      'phone_number': instance.phoneNumber,
    };
