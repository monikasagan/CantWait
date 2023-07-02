<<<<<<< HEAD
import 'dart:async';

=======
>>>>>>> d6ab9619efb94bd21bb0660f39b291283a18905a
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:gansa/app/core/enums.dart';
<<<<<<< HEAD
import 'package:gansa/presentation/pages/auth/register/register_page.dart';
=======
import 'package:meta/meta.dart';
>>>>>>> d6ab9619efb94bd21bb0660f39b291283a18905a

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit()
      : super(
          AuthState(
<<<<<<< HEAD
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
=======
              status: Status.initial,
              emailController: TextEditingController(),
              passwordController: TextEditingController(),
              errorMessage: ''),
        );
>>>>>>> d6ab9619efb94bd21bb0660f39b291283a18905a
}
