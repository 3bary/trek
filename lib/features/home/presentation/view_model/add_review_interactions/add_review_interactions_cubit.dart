import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repos/home/home_repo_imp.dart';

part 'add_review_interactions_state.dart';

class AddReviewInteractionsCubit extends Cubit<AddReviewInteractionsState> {
  final HomeRepoImp homeRepoImp;

  AddReviewInteractionsCubit(this.homeRepoImp)
    : super(AddReviewInteractionsInitial());

  Future<void> likeReview(String interactionType, String reviewId) async {
    emit(AddReviewInteractionsLoading());
    final result = await homeRepoImp.addInteractionsReview(
      interactionType,
      reviewId,
    );
    result.fold(
      (failure) => emit(AddReviewInteractionsFailure(failure.errorMessage)),
      (message) => emit(AddReviewInteractionsSuccess(message)),
    );
  }
}
