import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:gansa/app/core/enums.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit()
      : super(
          LoginState(),
        );

  Future<void> start() async {
    emit(
      LoginState(user: state.user),
    );
  }

  Future<void> signIn({
    required String email,
    required String password,
  }) async {
    emit(
      LoginState(user: null),
    );
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      LoginState(
        status: Status.succes,
        user: state.user,
      );
    } catch (error) {
      emit(
        LoginState(
          status: Status.error,
          errorMessage: error.toString(),
        ),
      );
    }
  }

  
Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }
}
