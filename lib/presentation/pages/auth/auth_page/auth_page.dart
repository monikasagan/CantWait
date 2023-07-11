import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
            final errorMessage = state.errorMessage ?? 'Unkown error';
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(errorMessage),
                backgroundColor: Colors.purple,
              ),
            );
          }
        },
        builder: (context, state) {
          final user = state.user;
          if (state.status == Status.loading) {
            const Scaffold(
              body: Center(
                child: CircularProgressIndicator(
                  color: Colors.indigo,
                  backgroundColor: Color.fromARGB(255, 43, 54, 114),
                ),
              ),
            );
          }
          if (state.status == Status.initial) {
            const Scaffold(
              body: Center(
                child: CircularProgressIndicator(
                  color: Colors.orange,
                  backgroundColor: Color.fromARGB(255, 43, 54, 114),
                ),
              ),
            );
          }

          if (user == null) {
            return const LoginPage();
          }
          return const HomePage();

          // switch (state.status) {
          //   case Status.initial:
          //     return const Center(
          //       child: Text('Initialization..'),
          //     );

          //   case Status.error:
          //     return Scaffold(
          //       body: Center(
          //         child: Text(
          //           state.errorMessage.toString(),
          //         ),
          //       ),
          //     );
          //   case Status.loading:
          //     return const Scaffold(
          //       body: Center(
          //         child: CircularProgressIndicator(
          //           color: Colors.indigo,
          //           backgroundColor: Color.fromARGB(255, 43, 54, 114),
          //         ),
          //       ),
          //     );
          //   case Status.succes:
          //     if (user == null) {
          //       return const LoginPage();
          //     }
          //     return const HomePage();
          // }
        },
      ),
    );
  }
}
