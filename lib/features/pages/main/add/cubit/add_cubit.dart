import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

part 'add_state.dart';

class AddCubit extends Cubit<AddState> {
  AddCubit() : super(AddState());

  Future<void> add(String title, String imageURL) async {
    try {
      await FirebaseFirestore.instance.collection('events').add({
        'title': title,
        'image_URL': imageURL,
      });
      emit(
        AddState(saved: true),
      );
    } catch (error) {
      emit(
        AddState(
          errorMessage: error.toString(),
        ),
      );
    }
  }

}
