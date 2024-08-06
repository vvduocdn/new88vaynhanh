import 'package:hive_flutter/hive_flutter.dart';
import 'package:logger/logger.dart';
import 'package:new88_vaynow/model/user/authen/login_response.dart';
import 'package:new88_vaynow/model/user/jwt.dart';
import 'package:new88_vaynow/model/user/order_address_hive.dart';
import 'package:new88_vaynow/model/user/user.dart';
import 'package:new88_vaynow/model/user/user_info.dart';

class HiveDataManager {
  final Logger _logger = Logger();
  Box<User>? _userBox;
  Box<String>? _userLanguageBox;
  Box<bool>? _userThemeBox;

  HiveDataManager._privateConstructor();

  static final HiveDataManager _instance =
      HiveDataManager._privateConstructor();

  factory HiveDataManager() {
    return _instance;
  }

  Future<void> _openUserBox() async {
    if (_userBox == null || !_userBox!.isOpen) {
      _userBox = await Hive.openBox<User>('loginBox');
    }
  }

  Future<void> _openUserLanguageBox() async {
    if (_userLanguageBox == null || !_userLanguageBox!.isOpen) {
      _userLanguageBox = await Hive.openBox<String>('userLanguageBox');
    }
  }

  Future<void> _openUserThemeBox() async {
    if (_userThemeBox == null || !_userThemeBox!.isOpen) {
      _userThemeBox = await Hive.openBox<bool>('userThemeBox');
    }
  }

  Future<void> _closeAllBoxes() async {
    await _userBox?.close();
    _userBox = null;
    await _userLanguageBox?.close();
    _userLanguageBox = null;
    await _userThemeBox?.close();
    _userThemeBox = null;
  }

  Future<void> saveUserInfo(
      String phone, String createdAt, String id, int money) async {
    await _openUserBox();
    var jwt = Jwt()
      ..token = ''
      ..expiredAt = '';
    var userInfo = UserInfo()
      ..id = id
      ..fullName = 'user$phone'
      ..avatar = ''
      ..email = ''
      ..money = '$money'
      ..createdAt = createdAt
      ..phone = phone ?? ''
      ..updatedAt = '';

    var user = const User()
        .copyWith(jwt: null, userInfo: userInfo, orderAddress: null);
    _logger.i("Save Token user to Hive: $user.");
    await _userBox?.put('currentLogin', user);
  }

  Future<void> saveOrderAddress(OrderAddressHive? orderAddress) async {
    await _openUserBox();
    User? currentUser = _userBox?.get('currentLogin');

    if (currentUser != null) {
      var user = currentUser.copyWith(orderAddress: orderAddress);
      await _userBox?.put('currentLogin', user);
      _logger.i(user);
    }
  }

  Future<OrderAddressHive?> getOrderAddress() async {
    await _openUserBox();
    User? user = _userBox?.get('currentLogin');
    _logger.i(user?.orderAddress);
    return user?.orderAddress;
  }

  Future<void> updateUserInfo(UserInfo updatedUserInfo) async {
    await _openUserBox();
    User? currentUser = _userBox?.get('currentLogin');

    if (currentUser != null) {
      var user = currentUser.copyWith(userInfo: updatedUserInfo);
      await _userBox?.put('currentLogin', user);
    }
  }

  Future<void> updateAvatar(String avatarUrl) async {
    await _openUserBox();
    User? currentUser = _userBox?.get('currentLogin');

    if (currentUser != null && currentUser.userInfo != null) {
      currentUser.userInfo!.avatar = avatarUrl;
      await _userBox?.put('currentLogin', currentUser);
      _logger.i("Avatar updated successfully.");
    }
  }

  Future<UserInfo?> getUserInfo() async {
    await _openUserBox();
    User? user = _userBox?.get('currentLogin');
    return user?.userInfo;
  }

  Future<String?> getToken() async {
    try {
      await _openUserBox();
      User? user = _userBox?.get('currentLogin');
      return user?.jwt?.token;
    } catch (e) {
      _logger.e('Error get Token: $e');
      return null;
    }
  }

  Future<bool> isLoggedIn() async {
    final token = await getToken();
    return token != null && token.isNotEmpty;
  }

  Future<void> logout() async {
    await _openUserBox();
    await _userBox?.delete('currentLogin');
    await _closeAllBoxes();
  }

  Future<String?> getUserLanguage() async {
    try {
      await _openUserLanguageBox();
      var languageSubtag =
          _userLanguageBox?.get('userLanguage', defaultValue: null);
      return languageSubtag;
    } catch (e) {
      _logger.e("Error getting user language: $e");
      return null;
    }
  }

  Future<void> saveUserLanguage(String languageSubtag) async {
    try {
      await _openUserLanguageBox();
      await _userLanguageBox?.put('userLanguage', languageSubtag);
    } catch (e) {
      _logger.e("Error saving user language: $e");
    }
  }

  Future<bool?> getUserTheme() async {
    try {
      await _openUserThemeBox();
      var userTheme = _userThemeBox?.get('userThemeBox', defaultValue: true);
      return userTheme;
    } catch (e) {
      _logger.e("Error getting user theme: $e");
      return null;
    }
  }

  Future<void> saveUserTheme(bool theme) async {
    try {
      await _openUserThemeBox();
      await _userThemeBox?.put('userThemeBox', theme);
    } catch (e) {
      _logger.e("Error saving user theme: $e");
    }
  }

  Future<bool> isLogin() async {
    UserInfo? userInfo = await getUserInfo();
    return userInfo != null;
  }
}
