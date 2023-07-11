part of 'home_cubit.dart';

class HomeState {
  HomeState({
    this.errorMessage,
    this.status = Status.initial,
    this.documents,
    this.user,
  });

  final String? errorMessage;
  final Status status;
  final QueryDocumentSnapshot<Map<String, dynamic>>? documents;
  final User? user;
}
