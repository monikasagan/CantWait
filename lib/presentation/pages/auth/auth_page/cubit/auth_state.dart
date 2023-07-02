part of 'auth_cubit.dart';

@immutable
class AuthState {
  final User? user;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final Status status;
  final String errorMessage;

  const AuthState({
    this.user,
    required this.emailController,
    required this.passwordController,
    required this.status,
    required this.errorMessage,
  });
}

class Controllers {
  final TextEditingController emailController;
  final TextEditingController passwordController;

  Controllers(
    this.emailController,
    this.passwordController,
  );
}
