import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:gansa/app/core/enums.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit()
      : super(
          AuthState(
              status: Status.initial,
              emailController: TextEditingController(),
              passwordController: TextEditingController(),
              errorMessage: ''),
        );
}
