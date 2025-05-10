
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:greendo/features/favorites/data/repos/place_favorite_repo_imp.dart';

import '../../../../core/models/place_model.dart';

part 'favorite_places_state.dart';

class FavoritePlacesCubit extends Cubit<FavoritePlacesState> {
  final FavoritePlaceRepoImp favoritePlacesRepoImp;

  FavoritePlacesCubit(this.favoritePlacesRepoImp) : super(FavoritePlacesInitial());

  Future<void> getSavedPlaces() async {
    emit(FavoritePlacesLoading());
    var results = await favoritePlacesRepoImp.getSavedPlaces();
    results.fold(
      (failure) => emit(FavoritePlacesError(failure.errorMessage)),
      (places) => emit(FavoritePlacesLoaded(places)),
    );
  }
}
