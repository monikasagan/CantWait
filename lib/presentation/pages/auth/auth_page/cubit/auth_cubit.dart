import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:gansa/app/core/enums.dart';
import 'package:gansa/presentation/pages/auth/register/register_page.dart';

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

  Future<void> start() async {
    emit(
      AuthState(
        emailController: TextEditingController(),
        passwordController: TextEditingController(),
        status: Status.loading,
        errorMessage: '',
      ),
    );

  }

  Future<void> signIn({required String email, required String password}) async {
    emit(
      AuthState(
        emailController: TextEditingController(),
        passwordController: TextEditingController(),
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
