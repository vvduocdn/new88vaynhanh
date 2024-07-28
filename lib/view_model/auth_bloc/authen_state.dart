part of 'authen_bloc.dart';

class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class LoginSuccess extends AuthState {
  final String status;

  LoginSuccess(this.status);
}

class CheckUserSuccess extends AuthState {
  final String status;

  CheckUserSuccess(this.status);
}

class RegisterSuccess extends AuthState {
  final String status;

  RegisterSuccess(this.status);
}

class AuthFailure extends AuthState {
  final String message;

  AuthFailure(this.message);
}

class DeleteAccountSuccess extends AuthState {
  final String deleteResponse;
  DeleteAccountSuccess(this.deleteResponse);
}

class OpenScreen extends AuthState {
  final bool isOpenScreen;

  OpenScreen(this.isOpenScreen);
}
