import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:gansa/app/core/enums.dart';
import 'package:gansa/models/item_model.dart';
import 'package:gansa/repositories/items_repository.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._itemsRepository) : super(HomeState());

  StreamSubscription? _streamSubscription;

  final ItemsRepository _itemsRepository;

  Future<void> start() async {
    _streamSubscription = _itemsRepository.getItemsStream().listen((items) {
      emit(
        HomeState(
          status: Status.succes,
          items: items,
        ),
      );
    })
      ..onError((error) {
        emit(
          HomeState(
            status: Status.error,
            errorMessage: error.toString(),
          ),
        );
      });
  }

  Future<void> delete({required String documentID}) async {
    try {
      await _itemsRepository.delete(id: documentID);
    } catch (error) {
      emit(
        HomeState(
          status: Status.error,
          errorMessage: error.toString(),
        ),
      );
    }
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
    emit(
      HomeState(user: null),
    );
  }
}
