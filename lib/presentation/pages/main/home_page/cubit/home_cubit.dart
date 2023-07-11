import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:gansa/app/core/enums.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeState());

  Future<void> start() async {
    emit(
      HomeState(
        status: Status.succes,
        user: state.user,
      ),
    );
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
    emit(
      HomeState(user: null),
    );
  }
}
