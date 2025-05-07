import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:greendo/features/home/data/models/review_model.dart';
import 'package:greendo/features/home/data/repos/home/home_repo_imp.dart';


part 'place_reviews_state.dart';

class PlaceReviewsCubit extends Cubit<PlaceReviewsState> {
  final HomeRepoImp homeRepoImp;


  PlaceReviewsCubit(this.homeRepoImp) : super(PlaceReviewsInitial());

  void getPlaceReviews(String placeId) async {
    emit(PlaceReviewsLoading());

    final result = await homeRepoImp.getPlaceReviews(placeId);
    result.fold(
      (failure) => emit(PlaceReviewsFailure(failure.errorMessage)),
      (reviews) => emit(PlaceReviewsSuccess(reviews)),
    );
  }
}
