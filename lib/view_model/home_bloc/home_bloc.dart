import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:vaynow_flutter/component/app_flush_bar.dart';
import 'package:vaynow_flutter/l10n/localization/app_localizations.dart';
import 'package:vaynow_flutter/model/home/banner_model.dart';
import 'package:vaynow_flutter/model/home/cart_body.dart';
import 'package:vaynow_flutter/model/home/cart_model.dart';
import 'package:vaynow_flutter/model/home/history_order_model.dart';
import 'package:vaynow_flutter/model/home/menu_restaurant_model.dart';
import 'package:vaynow_flutter/model/home/notification_model.dart';
import 'package:vaynow_flutter/model/home/order_address_body.dart';
import 'package:vaynow_flutter/model/home/order_address_model.dart';
import 'package:vaynow_flutter/model/home/order_body.dart';
import 'package:vaynow_flutter/model/home/product_delete_model.dart';
import 'package:vaynow_flutter/model/home/product_model.dart';
import 'package:vaynow_flutter/model/home/restaurant_model.dart';
import 'package:vaynow_flutter/model/user/order_address_hive.dart';
import 'package:vaynow_flutter/services/api/api_client.dart';
import 'package:vaynow_flutter/services/api/supa_base_api.dart';
import 'package:vaynow_flutter/services/di/locator.dart';
import 'package:vaynow_flutter/services/hive/hive_data_manager.dart';
import 'package:vaynow_flutter/utils/logger_service.dart';
import 'package:vaynow_flutter/utils/navigator_global_context_helper.dart';
import 'package:vaynow_flutter/utils/spaces.dart';
import 'package:vaynow_flutter/utils/time_helper.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final appLogger = Logger();
  final api = locator<ApiClient>();

  HomeBloc()
      : super(HomeState(
          isBottomNavigationShow: true,
          orderAddresss: const [],
          notifications: const [],
          restaurantsMenu: const [],
          searchRestaurants: const [],
          restaurantsProducts: const [],
          listAds: const [],
          restaurants: const [],
          dateSelected: DateTime.now(),
          focusedDay: DateTime.now(),
          sortDate: DateTime.now().dmy.toString(),
          historyOrders: const [],
        )) {
    on<PostAccountEvent>(_onPostAccountEvent);
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
      final response = await SupaBaseApi().insertAccount(event.phone);
      if (response.isNotEmpty) {
        HiveDataManager().saveUserInfo(event.phone);
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
