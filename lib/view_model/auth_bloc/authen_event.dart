part of 'authen_bloc.dart';

abstract class AuthEvent {}

class LoginEvent extends AuthEvent {
  final String email;
  final String password;
  final Function func;

  LoginEvent({required this.email, required this.password, required this.func});
}

class RegisterEvent extends AuthEvent {
  final String email;
  final String password;
  final String fullName;
  final String phoneNumber;
  final Function func;

  RegisterEvent(
      {required this.email,
      required this.password,
      required this.fullName,
      required this.phoneNumber,
      required this.func});
}

class LoginGoogleEvent extends AuthEvent {
  final String tokenFirebase;

  LoginGoogleEvent({required this.tokenFirebase});
}

class CheckUserEvent extends AuthEvent {
  final String userName;
  final Function func;

  CheckUserEvent({required this.userName, required this.func});
}

class ChangePassWordEvent extends AuthEvent {
  final String currentPassword;
  final String newPassword;
  final String newPassword2;

  ChangePassWordEvent(
      {required this.currentPassword,
      required this.newPassword,
      required this.newPassword2});
}

class DeleteAccountEvent extends AuthEvent {
  final String id;
  DeleteAccountEvent({required this.id});
}

class OpenScreenEvent extends AuthEvent {
  final bool status;
  OpenScreenEvent({required this.status});
}
