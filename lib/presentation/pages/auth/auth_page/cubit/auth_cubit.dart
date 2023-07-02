import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:gansa/app/core/enums.dart';
import 'package:gansa/presentation/pages/auth/register/register_page.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit()
      : super(
          AuthState(
            status: Status.initial,
            emailController: TextEditingController(),
            passwordController: TextEditingController(),
            errorMessage: '',
          ),
        );
  StreamSubscription? _streamSubscription;

  Future<void> start() async {
    emit(
      AuthState(
        emailController: emailController,
        passwordController: passwordController,
        status: Status.loading,
        errorMessage: '',
      ),
    );

    _streamSubscription =
        FirebaseAuth.instance.authStateChanges().listen((user) {
      emit(
        AuthState(
          user: user,
          emailController: TextEditingController(),
          passwordController: TextEditingController(),
          status: Status.succes,
          errorMessage: '',
        ),
      );
    })
          ..onError((error) {
            emit(
              AuthState(
                user: null,
                emailController: TextEditingController(),
                passwordController: TextEditingController(),
                status: Status.error,
                errorMessage: error.toString(),
              ),
            );
          });
  }

  Future<void> signIn({required String email, required String password}) async {
    emit(
      AuthState(
        emailController: emailController,
        passwordController: passwordController,
        errorMessage: '',
        status: Status.loading,
      ),
    );
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<void> signOut() async {
    FirebaseAuth.instance.signOut();
  }
}
