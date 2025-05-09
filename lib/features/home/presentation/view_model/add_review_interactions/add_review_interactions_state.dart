part of 'add_review_interactions_cubit.dart';


abstract class AddReviewInteractionsState extends Equatable{
  const AddReviewInteractionsState();
  @override
  List<Object> get props => [];
}

final class AddReviewInteractionsInitial extends AddReviewInteractionsState {}

final class AddReviewInteractionsLoading extends AddReviewInteractionsState {}

final class AddReviewInteractionsSuccess extends AddReviewInteractionsState {
  final String message;
  const AddReviewInteractionsSuccess(this.message);
  @override
  List<Object> get props => [message];
}

final class AddReviewInteractionsFailure extends AddReviewInteractionsState {
  final String errorMessage;
  const AddReviewInteractionsFailure(this.errorMessage);
  @override
  List<Object> get props => [errorMessage];
}
