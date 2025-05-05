

part of 'save_places_cubit.dart';

abstract class SavePlaceState extends Equatable {
  const SavePlaceState();

  @override
  List<Object> get props => [];
}

class SavePlaceInitial extends SavePlaceState {}

class SavePlaceLoading extends SavePlaceState {}

class SavePlaceSuccess extends SavePlaceState {
  final String message;

  const SavePlaceSuccess(this.message);

  @override
  List<Object> get props => [message];
}

class SavePlaceFailure extends SavePlaceState {
  final String error;

  const SavePlaceFailure(this.error);

  @override
  List<Object> get props => [error];
}
