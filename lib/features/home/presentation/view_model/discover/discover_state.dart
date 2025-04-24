import '../../../data/models/placeCard_model.dart';

sealed class DiscoverState {}

final class DiscoverInitial extends DiscoverState {}

final class DiscoverLoading extends DiscoverState {}

final class DiscoverRefreshing extends DiscoverState {}

final class DiscoverLoaded extends DiscoverState {
  final List<PlaceCardModel> places;
  DiscoverLoaded(this.places);
}

final class DiscoverError extends DiscoverState {
  final String message;
  DiscoverError(this.message);
} 