import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/repos/home/home_repo_imp.dart';

part 'save_places_state.dart';

class SavePlaceCubit extends Cubit<SavePlaceState> {
  final HomeRepoImp homeRepoImp;

  SavePlaceCubit(this.homeRepoImp) : super(SavePlaceInitial());

  Future<void> savePlace(String placeId) async {
    emit(SavePlaceLoading());

    final result = await homeRepoImp.addPlaceToFavorites(placeId);

    result.fold(
          (failure) => emit(SavePlaceFailure(failure.errorMessage)),
          (message) => emit(SavePlaceSuccess(message)),
    );
  }
}
