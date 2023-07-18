import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gansa/app/core/enums.dart';
import 'package:gansa/models/user_model.dart';
import 'package:gansa/repositories/sign_in_repository.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._signInRepository)
      : super(
          LoginState(),
        );

  final SignInRepository _signInRepository;

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
      await _signInRepository.signInWithEmailAndPassword(
          email: email, password: password);
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
    await _signInRepository.signOut();
  }
}
