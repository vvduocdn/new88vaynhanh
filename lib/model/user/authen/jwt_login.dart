class JWTLogin {
  final String token;
  final String expiredAt;

  JWTLogin({
    required this.token,
    required this.expiredAt,
  });

  factory JWTLogin.fromJson(Map<String, dynamic> json) {
    return JWTLogin(
      token: json['token'],
      expiredAt: json['expiredAt'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'token': token,
      'expiredAt': expiredAt,
    };
  }
}
