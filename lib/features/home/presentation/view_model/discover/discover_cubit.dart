import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/placeCard_model.dart';
import '../../../data/repos/discover_repo.dart';
import 'discover_state.dart';

class DiscoverCubit extends Cubit<DiscoverState> {
  final DiscoverRepo placeRepo;
  List<PlaceCardModel> places = [];

  DiscoverCubit(this.placeRepo) : super(DiscoverInitial());

  void getAllPlaces({bool isRefresh = false}) {
    if (isRefresh) {
      emit(DiscoverRefreshing());
    } else {
      emit(DiscoverLoading());
    }

    placeRepo
        .getAllPlaces()
        .then((places) {
          print('✅ Places Fetched: ${places.length}');
          emit(DiscoverLoaded(places));
          this.places = places;
        })
        .catchError((e) {
          print('❌ Error while fetching places: $e');
          emit(DiscoverError(e.toString()));
        });
  }
}
