part of 'add_like_to_place_cubit.dart';

abstract class LikePlaceState extends Equatable {
  const LikePlaceState();

  @override
  List<Object> get props => [];
}

class LikePlaceInitial extends LikePlaceState {}

class LikePlaceLoading extends LikePlaceState {}

class LikePlaceSuccess extends LikePlaceState {
  final String message;

  const LikePlaceSuccess(this.message);

  @override
  List<Object> get props => [message];
}

class LikePlaceFailure extends LikePlaceState {
  final String error;

  const LikePlaceFailure(this.error);

  @override
  List<Object> get props => [error];
}
