import 'package:hive_flutter/hive_flutter.dart';

part 'social_network.g.dart';

@HiveType(typeId: 2)
class SocialNetwork extends HiveObject {
  @HiveField(0)
  int? type;

  @HiveField(1)
  String? link;

  @HiveField(2)
  String? socialNetworkName;
}
