part of 'login_cubit.dart';

class LoginState {
  final User? user;
  final Status status;
  final String? errorMessage;

  LoginState({
    this.user,
    this.errorMessage,
    this.status = Status.initial,
  });
}
