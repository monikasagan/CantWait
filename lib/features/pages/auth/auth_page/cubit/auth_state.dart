part of 'auth_cubit.dart';

@immutable
class AuthState {
  final User? user;
  final Status status;
  final String? errorMessage;

  const AuthState({
    this.user,
     this.status=Status.initial,
    this.errorMessage,
  });
}
