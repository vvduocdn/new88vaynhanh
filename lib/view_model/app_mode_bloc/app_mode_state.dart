import 'package:equatable/equatable.dart';
import 'package:vaynow_flutter/model/app_mode/app_mode.dart';

abstract class AppModeState extends Equatable {
  const AppModeState();

  @override
  List<Object> get props => [];
}

class AppModeInitial extends AppModeState {}

class AppModeLoading extends AppModeState {}

class AppModeLoaded extends AppModeState {
  final AppMode appMode;

  const AppModeLoaded(this.appMode);

  @override
  List<Object> get props => [appMode];
}

class AppModeError extends AppModeState {
  final String message;

  const AppModeError(this.message);

  @override
  List<Object> get props => [message];
}
