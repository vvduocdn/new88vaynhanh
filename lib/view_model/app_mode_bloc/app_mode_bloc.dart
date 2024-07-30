import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new88_vaynow/utils/logger_service.dart';
import 'app_mode_event.dart';
import 'app_mode_state.dart';

class AppModeBloc extends Bloc<AppModeEvent, AppModeState> {
  AppModeBloc() : super(AppModeInitial()) {
    on<LoadAppMode>((event, emit) async {
      emit(AppModeLoading());
      try {
        printE('AppMode response oke');
      } catch (e) {
        printE('AppMode catch error: $e');
      }
    });
  }
}
