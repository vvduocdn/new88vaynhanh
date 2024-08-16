import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:new88_vaynow/model/user/jwt.dart';
import 'package:new88_vaynow/model/user/order_address_hive.dart';
import 'package:new88_vaynow/model/user/user_info.dart';

part 'user.g.dart';

@HiveType(typeId: 0)
class User extends Equatable {
  @HiveField(0)
  final Jwt? jwt;

  @HiveField(1)
  final UserInfo? userInfo;

  @HiveField(2)
  final OrderAddressHive? orderAddress;

  const User({this.jwt, this.userInfo, this.orderAddress});

  User copyWith({Jwt? jwt, UserInfo? userInfo, OrderAddressHive? orderAddress}) {
    return User(jwt: jwt ?? this.jwt, userInfo: userInfo ?? this.userInfo, orderAddress: orderAddress ?? this.orderAddress);
  }

  @override
  List<Object?> get props => [jwt, userInfo, orderAddress];
}
