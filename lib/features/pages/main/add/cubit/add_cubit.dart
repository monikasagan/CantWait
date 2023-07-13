import 'package:bloc/bloc.dart';
import 'package:gansa/app/core/enums.dart';
import 'package:gansa/repositories/items_repository.dart';

part 'add_state.dart';

class AddCubit extends Cubit<AddState> {
  AddCubit(this._itemsRepository) : super(AddState());

  final ItemsRepository _itemsRepository;

  Future<void> add(
    String title,
    String imageURL,
    DateTime releaseDate,
  ) async {
    try {
      await _itemsRepository.add(title, imageURL, releaseDate);
      emit(
        AddState(status: Status.loading),
      );
      emit(
        AddState(
          status: Status.succes,
        ),
      );
    } catch (error) {
      emit(
        AddState(
          status: Status.error,
          errorMessage: error.toString(),
        ),
      );
    }
  }
}
