import '../../../data/models/place_model.dart';

sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeLoading extends HomeState {}


final class HomeLoaded extends HomeState {
  final List<PlaceModel> places;
  HomeLoaded(this.places);
}

final class HomeError extends HomeState {
  final String message;
  HomeError(this.message);
} 