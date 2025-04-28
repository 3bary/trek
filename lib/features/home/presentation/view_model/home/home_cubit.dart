import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repos/home/home_repo.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo homeRepo;

  HomeCubit(this.homeRepo) : super(HomeInitial());

  Future<void> fetchAllPlaces() async {
    emit(HomeLoading());
    var results = await homeRepo.getAllPlaces();
    results.fold(
      (failure) => emit(HomeError(failure.errorMessage)),
      (places) => emit(HomeLoaded(places)),
    );
  }

  Future<void> fetchPlacesByCategory(String category) async {
    emit(HomeLoading());
    var results = await homeRepo.getSearchCategory(category);
    results.fold(
      (failure) => emit(HomeError(failure.errorMessage)),
      (places) => emit(HomeLoaded(places)),
    );
  }
}
