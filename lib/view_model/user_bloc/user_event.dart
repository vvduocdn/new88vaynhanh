part of 'user_bloc.dart';

sealed class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class GetCurrentUserInfo extends UserEvent {}

class GetOrderAddress extends UserEvent {}

class GetFollowsBLV extends UserEvent {
  final Function(bool status) func;
  const GetFollowsBLV({required this.func});
}

class ClearDataInUserBloc extends UserEvent {}

class LoadLanguage extends UserEvent {}

class GetTheme extends UserEvent {}

class UpdateLanguage extends UserEvent {
  final String newLanguage;

  const UpdateLanguage({required this.newLanguage});

  @override
  List<Object> get props => [newLanguage];
}

class GetListFollows extends UserEvent {
  final int current;
  final int pageSize;

  const GetListFollows({required this.pageSize, required this.current});

  @override
  List<Object> get props => [current, pageSize];
}

class UpdateInfoUserEvent extends UserEvent {
  final String fullName;
  final String phoneNumber;
  final String id;
  final Function(String messager, int status) func;
  @override
  List<Object> get props => [fullName, phoneNumber, id];

  const UpdateInfoUserEvent(
      {required this.fullName,
      required this.phoneNumber,
      required this.id,
      required this.func});
}

class UpdateStateEdit extends UserEvent {
  final bool isEdit;

  const UpdateStateEdit({required this.isEdit});

  @override
  List<Object> get props => [isEdit];
}

class ChangePasswordEvent extends UserEvent {
  final String passwordOld;
  final String passwordNew;
  final Function(String message, int status) func;

  const ChangePasswordEvent(
      {required this.passwordOld,
      required this.passwordNew,
      required this.func});

  @override
  List<Object> get props => [passwordOld, passwordNew];
}

class GetRandomColor extends UserEvent {}
