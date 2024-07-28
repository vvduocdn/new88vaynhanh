import 'package:hive_flutter/hive_flutter.dart';

part 'jwt.g.dart';

@HiveType(typeId: 1)
class Jwt extends HiveObject {
  @HiveField(0)
  String? token;

  @HiveField(1)
  String? expiredAt;

  Jwt({
    this.token,
    this.expiredAt,
  });
}
