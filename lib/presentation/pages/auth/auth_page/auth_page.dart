import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gansa/app/core/enums.dart';
import 'package:gansa/presentation/pages/auth/auth_page/cubit/auth_cubit.dart';
import 'package:gansa/presentation/pages/auth/login/login_page.dart';

class AuthPage extends StatefulWidget {
  @override
  State<AuthPage> createState() => _AuthPageState();
  const AuthPage({super.key});
}

class _AuthPageState extends State<AuthPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state.status == Status.error) {
            final errorMessage = state.errorMessage;
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(errorMessage),
                backgroundColor: Colors.red,
              ),
            );
          }
          if (state.status == Status.loading) {
            const CircularProgressIndicator();
          }
        },
        builder: (context, state) {
          final user = state.user;
          if (user == null) {
            return LoginPage();
          } else {
            return const Scaffold();
          }
        },
      ),
    );
  }
}
