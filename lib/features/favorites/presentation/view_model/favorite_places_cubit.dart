
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:greendo/features/favorites/data/repos/place_favorite_repo.dart';

import '../../../../core/models/place_model.dart';

part 'favorite_places_state.dart';

class FavoritePlacesCubit extends Cubit<FavoritePlacesState> {
  final FavoritePlaceRepo favoritePlacesRepo;

  FavoritePlacesCubit(this.favoritePlacesRepo) : super(FavoritePlacesInitial());

  Future<void> fetchAllPlaces() async {
    emit(FavoritePlacesLoading());
    var results = await favoritePlacesRepo.getSavedPlaces();
    results.fold(
      (failure) => emit(FavoritePlacesError(failure.errorMessage)),
      (places) => emit(FavoritePlacesLoaded(places)),
    );
  }
}
