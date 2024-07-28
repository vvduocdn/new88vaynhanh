import 'package:hive_flutter/hive_flutter.dart';
part 'user_info.g.dart';

@HiveType(typeId: 3)
class UserInfo extends HiveObject {
  @HiveField(0)
  String? id;

  @HiveField(2)
  String? avatar;

  @HiveField(3)
  String? fullName;

  @HiveField(4)
  String? updatedAt;

  @HiveField(5)
  String? role;

  @HiveField(6)
  String? createdAt;

  @HiveField(7)
  String? status;

  @HiveField(8)
  String? email;

  @HiveField(9)
  String? phone;

  UserInfo(
      {this.id,
      this.createdAt,
      this.updatedAt,
      this.avatar,
      this.fullName,
      this.email,
      this.status,
      this.role,
      this.phone});

  factory UserInfo.fromJson(Map<String, dynamic> json) => UserInfo(
        id: json['id'] as String?,
        createdAt: json['createdAt'] as String?,
        updatedAt: json['updatedAt'] as String?,
        avatar: json['avatar'] as String?,
        fullName: json['fullName'] as String?,
        email: json['email'] as String?,
        status: json['status'] as String?,
        role: json['role'] as String?,
        phone: json['phone_number'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'createdAt': createdAt,
        'updatedAt': updatedAt,
        'avatar': avatar,
        'fullName': fullName,
        'email': email,
        'status': status,
        'role': role,
        'phone_number': phone,
      };
  @override
  String toString() {
    return 'UserInfo{id: $id, email: $email, avatar: $avatar, '
        'fullName: $fullName, createdAt: $createdAt, role: $role, phone: $phone, status: $status, updatedAt: $updatedAt}';
  }
}
