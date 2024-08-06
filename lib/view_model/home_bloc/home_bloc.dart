import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bcrypt/flutter_bcrypt.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:logger/logger.dart';
import 'package:new88_vaynow/component/app_flush_bar.dart';
import 'package:new88_vaynow/l10n/localization/app_localizations.dart';
import 'package:new88_vaynow/services/api/api_client.dart';
import 'package:new88_vaynow/services/api/supa_base_api.dart';
import 'package:new88_vaynow/services/di/locator.dart';
import 'package:new88_vaynow/services/hive/hive_data_manager.dart';
import 'package:new88_vaynow/utils/logger_service.dart';
import 'package:new88_vaynow/utils/navigator_global_context_helper.dart';
import 'dart:math';
import 'package:new88_vaynow/utils/time_helper.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final appLogger = Logger();
  final api = locator<ApiClient>();

  HomeBloc()
      : super(HomeState(
          isBottomNavigationShow: true,
          dateSelected: DateTime.now(),
          focusedDay: DateTime.now(),
          sortDate: DateTime.now().dmy.toString(),
        )) {
    on<PostAccountEvent>(_onPostAccountEvent);
    on<RandomMoney>(_onRandomMoney);
    on<DisableAccountEvent>(_onDisableAccountEvent);
    on<LoginEvent>(_onLoginEvent);
  }

  int getRandomNumber(int min, int max) {
    final random = Random();
    return min + random.nextInt(max - min + 1);
  }

  Future<void> _onLoginEvent(
    LoginEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    try {
      final result = await SupaBaseApi().checkPhone(event.phone);

      if (result.isEmpty) {
        event.func.call('Tài khoản không tồn tại', false);
        return;
      }

      var inputPass = await hashPassword(event.pass);
      if (result.first['password'] != inputPass) {
        event.func.call('Mật khẩu không chính xác', false);
        return;
      }

      HiveDataManager().saveUserInfo(
        event.phone,
        result.first['created_at'].toString(),
        result.first['id'].toString(),
        int.parse((result.first['money'].toString())),
      );
      event.func.call('Đăng nhập thành công', true);
    } catch (e) {
      printE(e.toString());
    } finally {
      emit(state.copyWith(isLoading: false));
    }
  }

  Future<void> _onPostAccountEvent(
    PostAccountEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    try {
      final result = await SupaBaseApi().checkPhone(event.phone);
      if (result.isNotEmpty) {
        event.func.call('', false);
        return;
      }
      var passHashMd5 = await hashPassword(event.pass);
      final response = await SupaBaseApi()
          .insertAccount(event.phone, passHashMd5, event.money);
      if (response.isNotEmpty) {
        HiveDataManager().saveUserInfo(
          event.phone,
          response.first['created_at'].toString(),
          response.first['id'].toString(),
          int.parse((response.first['money'].toString())),
        );
        event.func.call('', true);
        return;
      }
      event.func.call('', false);
    } catch (e) {
      printE(e.toString());
    } finally {
      emit(state.copyWith(isLoading: false));
    }
  }

  Future<void> _onRandomMoney(
    RandomMoney event,
    Emitter<HomeState> emit,
  ) async {
    final money = getRandomNumber(3, 15);
    emit(state.copyWith(money: money * 1000000));
  }

  Future<void> _onDisableAccountEvent(
    DisableAccountEvent event,
    Emitter<HomeState> emit,
  ) async {
    try {
      final user = await HiveDataManager().getUserInfo();
      final result = await SupaBaseApi().checkPhone(user?.phone ?? '');

      var inputPass = await hashPassword(event.pass);
      if (result.first['password'] != inputPass) {
        event.func.call('', false);
        return;
      }
      final response = await SupaBaseApi().deleteAccount(user?.id ?? '');
      if (response.isNotEmpty) {
        event.func.call('', true);
        return;
      }
      event.func.call('', false);
    } catch (e) {
      printE(e.toString());
    }
  }

  Future<String> hashPassword(String password) async {
    // final salt = await FlutterBcrypt.salt();
    final String salt = dotenv.env['SALT']!;
    printE(salt);
    return await FlutterBcrypt.hashPw(
        password: password, salt: r'$2b$06$C6UzMDM.H6dfI/f/IKxGhu');
  }

  // fuc component hand error
  void handError(Object e, String message) {
    if (e is DioException && e.type == DioExceptionType.connectionError) {
      if (navigationService.getCurrentContext.mounted) {
        CommonFlushBar.show(navigationService.getCurrentContext, message,
            EFlushbarStatus.Failure);
      }
    }
    handErrorServer(e);
  }

  // fuc component hand error server
  void handErrorServer(Object e) {
    if (e is DioError) {
      if (e.response?.statusCode == 400) {
        if (navigationService.getCurrentContext.mounted) {
          final errorMessage = e.response?.data['error_message']['message'] ??
              AppLocalizations.of(navigationService.getCurrentContext)!.r135;
          CommonFlushBar.show(navigationService.getCurrentContext, errorMessage,
              EFlushbarStatus.Warning);
        }
      }
    }
  }
}
