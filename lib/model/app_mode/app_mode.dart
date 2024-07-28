class AppMode {
  final int id;
  final String appVersion;
  final String appPlatform;
  final bool appStatus;

  AppMode({
    required this.id,
    required this.appVersion,
    required this.appPlatform,
    required this.appStatus,
  });

  factory AppMode.fromJson(Map<String, dynamic> json) {
    return AppMode(
      id: json['id'],
      appVersion: json['appVersion'],
      appPlatform: json['appPlatform'],
      appStatus: json['appStatus'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'appVersion': appVersion,
      'appPlatform': appPlatform,
      'appStatus': appStatus,
    };
  }

  @override
  String toString() {
    return 'AppMode{id: $id, appVersion: $appVersion, appPlatform: $appPlatform, appStatus: $appStatus}';
  }
}
