part of 'favorite_places_cubit.dart';


sealed class FavoritePlacesState {}

final class FavoritePlacesInitial extends FavoritePlacesState {}
final class FavoritePlacesLoading extends FavoritePlacesState {}
final class FavoritePlacesLoaded extends FavoritePlacesState {
  final List<PlaceModel> places;
  FavoritePlacesLoaded(this.places);
}
final class FavoritePlacesError extends FavoritePlacesState {
  final String message;
  FavoritePlacesError(this.message);
}


