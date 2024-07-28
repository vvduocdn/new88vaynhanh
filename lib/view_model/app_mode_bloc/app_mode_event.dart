import 'package:equatable/equatable.dart';

abstract class AppModeEvent extends Equatable {
  const AppModeEvent();

  @override
  List<Object> get props => [];
}

class LoadAppMode extends AppModeEvent {}
