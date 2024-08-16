part of 'user_bloc.dart';

class UserState extends Equatable {
  final UserInfo? userInfo;
  final bool isLoggedIn;
  final String? loadedLanguage;
  final bool? isLoading;
  final String? statusFollowBLV;
  final bool? languageLoading;
  final String? userToken;
  final bool? isLoadingFollows;
  final bool? theme;
  final OrderAddressHive? orderAddress;
  final bool? isEditFullName;
  final bool? isChangePassword;
  final Color? colorAvatar;
  const UserState(
      {this.colorAvatar,
      this.userInfo,
      this.isLoggedIn = false,
      this.isEditFullName = false,
      this.isLoading = false,
      this.isLoadingFollows = false,
      this.loadedLanguage,
      this.statusFollowBLV = '',
      this.languageLoading = false,
      this.theme = true,
      this.isChangePassword = false,
      this.userToken = '',
      this.orderAddress});
  UserState.initial(
    this.loadedLanguage,
    this.theme,
    this.isLoading,
    this.statusFollowBLV,
    this.languageLoading,
    this.isLoadingFollows,
    this.isEditFullName,
    this.isChangePassword,
  )   : userInfo = null,
        isLoggedIn = false,
        userToken = '',
        orderAddress = null,
        colorAvatar = null;
  UserState copyWith({
    UserInfo? userInfo,
    bool? isLoggedIn,
    bool? isLoading,
    String? loadedLanguage,
    bool? languageLoading,
    bool? isLoadingFollows,
    String? statusFollowBLV,
    String? userToken,
    bool? theme,
    OrderAddressHive? orderAddress,
    bool? isEditFullName,
    bool? isChangePassword,
    Color? colorAvatar,
  }) {
    return UserState(
      isLoadingFollows: isLoadingFollows ?? this.isLoadingFollows,
      statusFollowBLV: statusFollowBLV ?? this.statusFollowBLV,
      isLoading: isLoading ?? this.isLoading,
      userInfo: userInfo ?? this.userInfo,
      isLoggedIn: isLoggedIn ?? this.isLoggedIn,
      loadedLanguage: loadedLanguage ?? this.loadedLanguage,
      languageLoading: languageLoading ?? this.languageLoading,
      theme: theme ?? this.theme,
      userToken: userToken ?? this.userToken,
      orderAddress: orderAddress ?? this.orderAddress,
      isChangePassword: isChangePassword ?? this.isChangePassword,
      isEditFullName: isEditFullName ?? this.isEditFullName,
      colorAvatar: colorAvatar ?? this.colorAvatar,
    );
  }

  @override
  List<Object?> get props => [
        userInfo,
        isLoggedIn,
        loadedLanguage,
        languageLoading,
        userToken,
        isLoading,
        isLoadingFollows,
        statusFollowBLV,
        theme,
        orderAddress,
        isEditFullName,
        isChangePassword,
        colorAvatar,
      ];
}
