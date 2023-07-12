import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:gansa/app/core/enums.dart';
import 'package:gansa/models/item_model.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeState());

  StreamSubscription? _streamSubscription;

  Future<void> start() async {
    _streamSubscription = FirebaseFirestore.instance
        .collection('events')
        .snapshots()
        .listen((items) {
      final itemModels = items.docs.map((doc) {
        return ItemModel(
          id: doc.id,
          title: doc['title'],
          imageURL: doc['image_URL'],
          releaseDate: (doc['release_date'] as Timestamp).toDate(),
        );
      }).toList();
      emit(
        HomeState(
          status: Status.succes,
          items: itemModels,
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

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
    emit(
      HomeState(user: null),
    );
  }
}
