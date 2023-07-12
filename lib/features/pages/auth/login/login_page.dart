import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gansa/app/core/enums.dart';
import 'package:gansa/components/button.dart';
import 'package:gansa/components/my_text_field.dart';
import 'package:gansa/features/pages/auth/register/register_page.dart';
import 'package:gansa/features/pages/main/home_page/home_page.dart';

import 'cubit/login_cubit.dart';

class LoginPage extends StatefulWidget {
  final Function()? onTap;
  @override
  State<LoginPage> createState() => _LoginPageState();
  const LoginPage({
    super.key,
    this.onTap,
  });
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit()..start(),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state.status == Status.error) {
            final errorMessage = state.errorMessage ?? 'Unkown error';
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(errorMessage),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        builder: (context, state) {
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
                  color: Colors.yellow,
                  backgroundColor: Color.fromARGB(255, 43, 54, 114),
                ),
              ),
            );
          }

          if (state.user == null) {
            return _LoginPageView(
                emailController: emailController,
                passwordController: passwordController);
          }
          return  HomePage();
          // switch (state.status) {
          //   case Status.loading:
          //     return const Center(
          //       child: CircularProgressIndicator(
          //         backgroundColor: Colors.indigo,
          //       ),
          //     );

          //   case Status.error:
          //     return const CircularProgressIndicator(
          //       color: Colors.red,
          //     );
          //   case Status.initial:
          //     return _LoginPageView(
          //         emailController: emailController,
          //         passwordController: passwordController);
          //   case Status.succes:
          //     return HomePage();
          // }
        },
      ),
    );
  }
}

class _LoginPageView extends StatelessWidget {
  const _LoginPageView({
    required this.emailController,
    required this.passwordController,
  });

  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.tsunami,
                size: 100,
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Welcome back you\'ve been missed!',
              ),
              const SizedBox(
                height: 20,
              ),
              MyTextField(
                controller: emailController,
                hintText: 'Email',
                obscureText: false,
              ),
              const SizedBox(
                height: 20,
              ),
              MyTextField(
                controller: passwordController,
                hintText: 'Password',
                obscureText: true,
              ),
              const SizedBox(
                height: 7,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 25.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    Text(
                      'Forgot your password?',
                    ),
                    SizedBox(
                      width: 25,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Button(
                onTap: () async {
                  await context.read<LoginCubit>().signIn(
                        email: emailController.text,
                        password: passwordController.text,
                      );
                },
                buttonTitle: 'Sign in',
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Not a member yet?',
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => const RegisterPage(),
                        ),
                      );
                    },
                    child: const Text(
                      'Register now!',
                      style: TextStyle(
                        color: Colors.indigo,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
