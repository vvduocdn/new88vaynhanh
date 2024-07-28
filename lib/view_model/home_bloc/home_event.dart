part of 'home_bloc.dart';

sealed class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}


class PostAccountEvent extends HomeEvent {
  final String phone;
  final Function(String message, bool status) func;

  const PostAccountEvent({required this.phone, required this.func});

  @override
  List<Object> get props => [
        phone,
      ];
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