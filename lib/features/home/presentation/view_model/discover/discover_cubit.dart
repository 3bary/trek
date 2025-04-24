import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repos/discover_repo.dart';
import 'discover_state.dart';

class DiscoverCubit extends Cubit<DiscoverState> {
  final DiscoverRepo discoverRepo;

  DiscoverCubit(this.discoverRepo) : super(DiscoverInitial());

  Future<void> fetchAllPlaces() async {
    emit(DiscoverLoading());
    try {
      final places = await discoverRepo.getAllPlaces();
      emit(DiscoverLoaded(places));
    } catch (e) {
      emit(DiscoverError("Failed to load places: $e"));
    }
  }

  Future<void> fetchPlacesByCategory(String category) async {
    emit(DiscoverLoading());
    try {
      final places = await discoverRepo.getPlacesByCategory(category);
      emit(DiscoverLoaded(places));
    } catch (e) {
      emit(DiscoverError("Failed to load places for category '$category': $e"));
    }
  }
}
