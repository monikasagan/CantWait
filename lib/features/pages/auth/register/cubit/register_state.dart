part of 'register_cubit.dart';

class RegisterState {
  final Status status;
  final UserModel? user;
  final String? errorMessage;

  RegisterState({
    this.user,
    this.errorMessage,
    this.status = Status.initial,
  });
}
