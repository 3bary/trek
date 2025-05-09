

part of 'add_interactions_cubit.dart';

abstract class AddInteractionsState extends Equatable {
  const AddInteractionsState();

  @override
  List<Object> get props => [];
}

class AddInteractionsInitial extends AddInteractionsState {}

class AddInteractionsLoading extends AddInteractionsState {}

class AddInteractionsSuccess extends AddInteractionsState {
  final String message;

  const AddInteractionsSuccess(this.message);

  @override
  List<Object> get props => [message];
}

class AddInteractionsFailure extends AddInteractionsState {
  final String error;

  const AddInteractionsFailure(this.error);

  @override
  List<Object> get props => [error];
}
