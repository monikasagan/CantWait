part of 'add_cubit.dart';

class AddState {
  AddState({
    this.saved = false,
    this.errorMessage,
  });

  final bool saved;
  final String? errorMessage;
}
