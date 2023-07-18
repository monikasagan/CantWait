part of 'login_cubit.dart';

class LoginState {
  final UserModel? user;
  final Status status;
  final String? errorMessage;

  LoginState({
    this.user,
    this.errorMessage,
    this.status = Status.initial,
  });
}
