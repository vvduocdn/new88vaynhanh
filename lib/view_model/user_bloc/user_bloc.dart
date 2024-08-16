import 'dart:math';
import 'dart:ui';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:new88_vaynow/model/user/authen/info_user_put_body.dart';
import 'package:new88_vaynow/model/user/order_address_hive.dart';
import 'package:new88_vaynow/model/user/user_info.dart';
import 'package:new88_vaynow/services/api/api_client.dart';
import 'package:new88_vaynow/services/di/locator.dart';
import 'package:new88_vaynow/services/hive/hive_data_manager.dart';
import 'package:new88_vaynow/utils/logger_service.dart';
part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final api = locator<ApiClient>();

  UserBloc() : super(const UserState()) {
    on<GetCurrentUserInfo>(_onGetCurrentUserInfo);
    on<ClearDataInUserBloc>(_onClearDataInUserBloc);
    on<LoadLanguage>(_onLoadLanguage);
    on<GetTheme>(_onGetTheme);
    on<UpdateLanguage>(_onUpdateLanguage);
    on<UpdateInfoUserEvent>(_onUpdateInfoUserEvent);
    on<GetOrderAddress>(_onGetOrderAddress);
    on<UpdateStateEdit>(_onUpdateStateEdit);
    on<ChangePasswordEvent>(_onChangePasswordEvent);
    on<GetRandomColor>(_onGetRandomColor);
  }
  Future<void> _onGetRandomColor(GetRandomColor event, Emitter<UserState> emit) async {
    Random random = Random();
    var color = Color.fromRGBO(
      random.nextInt(128) + 128,
      random.nextInt(128) + 128,
      random.nextInt(128) + 128,
      1.0,
    );
    emit(state.copyWith(
      colorAvatar: color,
    ));
  }

  Future<void> _onUpdateStateEdit(UpdateStateEdit event, Emitter<UserState> emit) async {
    emit(state.copyWith(
      isEditFullName: event.isEdit,
    ));
  }

  Future<void> _onChangePasswordEvent(ChangePasswordEvent event, Emitter<UserState> emit) async {}

  Future<void> _onGetOrderAddress(GetOrderAddress event, Emitter<UserState> emit) async {}

  Future<void> _onGetCurrentUserInfo(GetCurrentUserInfo event, Emitter<UserState> emit) async {
    try {
      final userInfo = await HiveDataManager().getUserInfo();
      if (userInfo != null) {
        emit(state.copyWith(
          userInfo: userInfo,
          isLoggedIn: true,
        ));
      } else {
        emit(state.copyWith(userInfo: UserInfo(), isLoggedIn: false));
      }
    } catch (e) {
      printE("Error in GetCurrentUserInfo: $e");
    }
  }

  Future<void> _onUpdateInfoUserEvent(UpdateInfoUserEvent event, Emitter<UserState> emit) async {
    emit(state.copyWith(isLoading: true));

    try {
      final body = InfoUserPutBody()..fullName = event.fullName;
      final response = await api.authServices.putUserInfo(body);

      final userInfo = await HiveDataManager().getUserInfo();
      if (userInfo != null) {
        userInfo.fullName = event.fullName;
        await HiveDataManager().updateUserInfo(userInfo);
      }

      event.func.call('Update userName success', response.message ?? 0);
      await Future.delayed(const Duration(milliseconds: 300)).then((value) {
        emit(state.copyWith(isEditFullName: false));
      });
    } catch (e) {
      emit(state.copyWith(isEditFullName: true));

      if (e is DioException && e.type == DioExceptionType.connectionError) {
        event.func.call('Có lỗi xảy ra , vui lòng kiểm tra internet!', 1);
      }
      if (e is DioError && e.response?.statusCode == 400) {
        event.func.call('Update user Failure', 1);
      }
      printE("Lỗi _onUpdateInfoUserEvent: $e");
    } finally {
      emit(state.copyWith(isLoading: false));
    }
  }

  Future<void> _onClearDataInUserBloc(ClearDataInUserBloc event, Emitter<UserState> emit) async {
    try {
      emit(UserState.initial(
        state.loadedLanguage,
        state.theme,
        state.isLoading,
        state.statusFollowBLV,
        state.languageLoading,
        state.isLoadingFollows,
        state.isEditFullName,
        state.isChangePassword,
      ));
    } catch (e) {
      printE("Lỗi ClearDataInUserBloc: $e");
    }
  }

  Future<void> _onLoadLanguage(LoadLanguage event, Emitter<UserState> emit) async {
    emit(state.copyWith(languageLoading: true));

    try {
      var currentLanguage = await HiveDataManager().getUserLanguage();

      if (currentLanguage == null) {
        var systemLocale = window.locale;
        var systemLanguage = systemLocale.languageCode;
        var box = await Hive.openBox<String>('userLanguageBox');

        await box.put('userLanguage', systemLanguage);
        await box.close();

        emit(state.copyWith(loadedLanguage: systemLanguage));
      } else {
        emit(state.copyWith(loadedLanguage: currentLanguage));
      }
    } catch (e) {
      printE('error _onLoadLanguage: $e');
    } finally {
      emit(state.copyWith(languageLoading: false));
    }
  }

  Future<void> _onGetTheme(GetTheme event, Emitter<UserState> emit) async {
    try {
      emit(state.copyWith(languageLoading: true));
      var currentThem = await HiveDataManager().getUserTheme();
      emit(state.copyWith(theme: currentThem));
    } catch (e) {
      printE('error _onGetTheme: $e');
    }
  }

  Future<void> _onUpdateLanguage(UpdateLanguage event, Emitter<UserState> emit) async {
    try {
      await HiveDataManager().saveUserLanguage(event.newLanguage);
      emit(state.copyWith(loadedLanguage: event.newLanguage));
    } catch (e) {
      printE("Error updating user language: $e");
    }
  }
}
