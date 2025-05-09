part of 'place_reviews_cubit.dart';

abstract class PlaceReviewsState {}

class PlaceReviewsInitial extends PlaceReviewsState {}

class PlaceReviewsLoading extends PlaceReviewsState {}

class PlaceReviewsSuccess extends PlaceReviewsState {
  final List<ReviewModel> reviews;

  PlaceReviewsSuccess(this.reviews);
}

class PlaceReviewsFailure extends PlaceReviewsState {
  final String error;

  PlaceReviewsFailure(this.error);
}
