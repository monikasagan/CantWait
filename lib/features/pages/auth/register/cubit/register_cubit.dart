import 'package:bloc/bloc.dart';
import 'package:gansa/app/core/enums.dart';
import 'package:gansa/models/user_model.dart';
import 'package:gansa/repositories/register_repository.dart';
import 'package:meta/meta.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this._registerRepository) : super(RegisterState());

  final RegisterRepository _registerRepository;

  Future<void> register({
    required String email,
    required String password,
  }) async {
    try {
      await _registerRepository.registerUser(
        email: email,
        password: password,
      );
      emit(
        RegisterState(status: Status.loading),
      );
      emit(
        RegisterState(
          status: Status.succes,
          user: state.user,
        ),
      );
    } catch (error) {
      emit(
        RegisterState(status: Status.error),
      );
    }
  }
}
