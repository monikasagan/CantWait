import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gansa/components/button.dart';
import 'package:gansa/components/text_field_login_page.dart';
import 'package:gansa/presentation/pages/auth/auth_page/cubit/auth_cubit.dart';
import 'package:gansa/presentation/pages/auth/register/register_page.dart';

class LoginPage extends StatefulWidget {
  final Function()? onTap;
  @override
  State<LoginPage> createState() => _LoginPageState();
  const LoginPage({super.key, this.onTap});
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit()..start(),
      child: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
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
                    TextFieldLoginPage(
                      controller: emailController,
                      hintText: 'Email',
                      obscureText: false,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFieldLoginPage(
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
                        await context.read<AuthCubit>().signIn(
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
        },
      ),
    );
  }
}
