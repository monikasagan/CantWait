part of 'home_cubit.dart';

class HomeState {
  HomeState({
    this.errorMessage,
    this.status = Status.initial,
    this.items = const [],
    this.user,
  });

  final String? errorMessage;
  final Status status;
  final List<ItemModel> items;
  final User? user;
}
