part of 'add_cubit.dart';

class AddState {
  AddState({
    this.errorMessage,
    this.status = Status.initial,
  });

  final String? errorMessage;
  final Status status;
}
