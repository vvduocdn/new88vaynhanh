class UserInfoLogin {
  String? id;
  String? username;
  String? password;
  String? avatar;
  String? fullName;
  String? phoneNumber;
  int? role;
  int? activeStatus;
  int? level;
  String? typeAccount;
  int? experience;
  int? point;
  int? totalTimeOnline;
  int? totalTimeOnlineExp;
  String? createdTime;
  String? lastedLogin;

  UserInfoLogin(
      {this.id,
      this.username,
      this.password,
      this.avatar,
      this.fullName,
      this.phoneNumber,
      this.role,
      this.activeStatus,
      this.level,
      this.typeAccount,
      this.experience,
      this.point,
      this.totalTimeOnline,
      this.totalTimeOnlineExp,
      this.createdTime,
      this.lastedLogin});

  UserInfoLogin.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    username = json['username'];
    password = json['password'];
    avatar = json['avatar'];
    fullName = json['fullName'];
    phoneNumber = json['phoneNumber'];
    role = json['role'];
    activeStatus = json['activeStatus'];
    level = json['level'];
    typeAccount = json['typeAccount'];
    experience = json['experience'];
    point = json['point'];
    totalTimeOnline = json['totalTimeOnline'];
    totalTimeOnlineExp = json['totalTimeOnlineExp'];
    createdTime = json['createdTime'];
    lastedLogin = json['lastedLogin'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['_id'] = id;
    data['username'] = username;
    data['password'] = this.password;
    data['avatar'] = this.avatar;
    data['fullName'] = this.fullName;
    data['phoneNumber'] = this.phoneNumber;
    data['role'] = this.role;
    data['activeStatus'] = this.activeStatus;
    data['level'] = this.level;
    data['typeAccount'] = this.typeAccount;
    data['experience'] = this.experience;
    data['point'] = this.point;
    data['totalTimeOnline'] = this.totalTimeOnline;
    data['totalTimeOnlineExp'] = this.totalTimeOnlineExp;
    data['createdTime'] = this.createdTime;
    data['lastedLogin'] = this.lastedLogin;
    return data;
  }
}
