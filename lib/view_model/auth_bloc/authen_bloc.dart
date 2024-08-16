import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:new88_vaynow/l10n/localization/app_localizations.dart';
import 'package:new88_vaynow/model/user/authen/login_body.dart';
import 'package:new88_vaynow/model/user/authen/signup_body.dart';
import 'package:new88_vaynow/services/api/api_client.dart';
import 'package:new88_vaynow/services/di/locator.dart';
import 'package:new88_vaynow/services/hive/hive_data_manager.dart';
import 'package:new88_vaynow/utils/navigator_global_context_helper.dart';
part 'authen_event.dart';
part 'authen_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final appLogger = Logger();
  final api = locator<ApiClient>();
  final NavigatorGlobalContextHelper navigationService = locator.get<NavigatorGlobalContextHelper>();
  AuthBloc() : super(AuthState()) {
    on<OpenScreenEvent>((event, emit) async {
      emit(OpenScreen(event.status));
    });
    on<LoginEvent>((event, emit) async {
      emit(AuthLoading());
      try {
        final response = await api.authServices.loginAccount(LoginBody()
          ..email = event.email
          ..password = event.password);
        if (response.success!) {
          // HiveDataManager().saveUserInfo(response.data!);
          if (navigationService.getCurrentContext.mounted) {
            emit(LoginSuccess(AppLocalizations.of(navigationService.getCurrentContext)!.r130));
          }
          event.func.call();
          return;
        }
        if (navigationService.getCurrentContext.mounted) {
          emit(AuthFailure(AppLocalizations.of(navigationService.getCurrentContext)!.r131));
        }
      } catch (error) {
        if (error is DioError) {
          if (error.response?.statusCode == 400 || error.response?.statusCode == 404) {
            if (navigationService.getCurrentContext.mounted) {
              final errorMessage = error.response?.data['error_message']['message'] ?? AppLocalizations.of(navigationService.getCurrentContext)!.r131;
              emit(AuthFailure('${AppLocalizations.of(navigationService.getCurrentContext)!.r131}: $errorMessage'));
            }
          }
        } else {
          if (navigationService.getCurrentContext.mounted) {
            emit(AuthFailure(AppLocalizations.of(navigationService.getCurrentContext)!.r132));
          }
        }
      }
    });

    on<RegisterEvent>((event, emit) async {
      emit(AuthLoading());
      try {
        final response = await api.authServices.signupAccount(SignupBody()
          ..email = event.email
          ..password = event.password
          ..phoneNumber = event.phoneNumber
          ..fullName = event.fullName);
        if (response.success!) {
          // HiveDataManager().saveUserInfo(response.data!);
          if (navigationService.getCurrentContext.mounted) {
            emit(RegisterSuccess(AppLocalizations.of(navigationService.getCurrentContext)!.r133));
          }
          event.func.call();
          return;
        }
        if (navigationService.getCurrentContext.mounted) {
          emit(AuthFailure(AppLocalizations.of(navigationService.getCurrentContext)!.r134));
        }
      } catch (error) {
        if (error is DioError) {
          if (error.response?.statusCode == 400 || error.response?.statusCode == 404) {
            if (navigationService.getCurrentContext.mounted) {
              final errorMessage = error.response?.data['error_message']['message'] ?? AppLocalizations.of(navigationService.getCurrentContext)!.r134;
              emit(AuthFailure('${AppLocalizations.of(navigationService.getCurrentContext)!.r134}: $errorMessage'));
            }
          }
        } else {
          if (navigationService.getCurrentContext.mounted) {
            emit(AuthFailure(AppLocalizations.of(navigationService.getCurrentContext)!.r132));
          }
        }
      }
    });
  }
}
