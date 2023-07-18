import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gansa/components/button.dart';
import 'package:gansa/components/my_text_field.dart';
import 'package:gansa/features/pages/auth/auth_page/cubit/auth_cubit.dart';
import 'package:gansa/features/pages/auth/login/login_page.dart';
import 'package:gansa/repositories/auth_repository.dart';

class RegisterPage extends StatefulWidget {
  final Function()? onTap;
  const RegisterPage({
    super.key,
    this.onTap,
  });

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

final emailController = TextEditingController();
final passwordController = TextEditingController();
final confirmPasswordController = TextEditingController();

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(AuthRepository()),
      child: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            body: Center(
              child: SafeArea(
                child: Expanded(
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
                        height: 20,
                      ),
                      MyTextField(
                        controller: confirmPasswordController,
                        hintText: 'Confirm your password',
                        obscureText: true,
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Button(
                        onTap: () {},
                        buttonTitle: 'Sign Up',
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Already have an account?',
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (_) => const LoginPage(),
                                ),
                              );
                            },
                            child: const Text(
                              'Sign In!',
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
            ),
          );
        },
      ),
    );
  }
}
