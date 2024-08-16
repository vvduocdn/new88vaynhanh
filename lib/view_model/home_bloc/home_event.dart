part of 'home_bloc.dart';

sealed class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class PostAccountEvent extends HomeEvent {
  final String phone;
  final String pass;
  final int money;

  final Function(String message, bool status) func;

  const PostAccountEvent({required this.phone, required this.pass, required this.func, required this.money});

  @override
  List<Object> get props => [phone, pass, money];
}

class CheckAccountEvent extends HomeEvent {
  final String phone;
  final Function(String message, bool status) func;

  const CheckAccountEvent({required this.phone, required this.func});

  @override
  List<Object> get props => [
        phone,
      ];
}

class DisableAccountEvent extends HomeEvent {
  final String pass;

  final Function(String message, bool status) func;

  const DisableAccountEvent({
    required this.pass,
    required this.func,
  });

  @override
  List<Object> get props => [pass];
}

class RandomMoney extends HomeEvent {}

class LoginEvent extends HomeEvent {
  final String phone;
  final String pass;
  final Function(String message, bool status) func;

  const LoginEvent({required this.phone, required this.pass, required this.func});

  @override
  List<Object> get props => [phone, pass];
}
