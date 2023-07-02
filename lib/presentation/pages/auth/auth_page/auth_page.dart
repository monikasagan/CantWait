import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
<<<<<<< HEAD
import 'package:gansa/app/core/enums.dart';
import 'package:gansa/presentation/pages/auth/auth_page/cubit/auth_cubit.dart';
import 'package:gansa/presentation/pages/auth/login/login_page.dart';
import 'package:gansa/presentation/pages/main/home_page/home_page.dart';

class AuthPage extends StatefulWidget {
  @override
  State<AuthPage> createState() => _AuthPageState();
  const AuthPage({super.key});
}

class _AuthPageState extends State<AuthPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit()..start(),
      child: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state.status == Status.error) {
            final errorMessage = state.errorMessage;
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  errorMessage.toString(),
                ),
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
            return const LoginPage();
          } else {
            return HomePage(user: user);
          }
        },
      ),
    );
  }
}
=======



>>>>>>> d6ab9619efb94bd21bb0660f39b291283a18905a
