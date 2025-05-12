import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/repos/home/home_repo_imp.dart';

part 'add_interactions_state.dart';

class AddInteractionsCubit extends Cubit<AddInteractionsState> {
  final HomeRepoImp homeRepoImp;

  AddInteractionsCubit(this.homeRepoImp) : super(AddInteractionsInitial());

  Future<void> handleInteraction(String placeId, String interactionType) async {
    emit(AddInteractionsLoading());

    try {
      final result = await homeRepoImp.addInteractionsPlace(placeId, interactionType);

      result.fold(
            (failure) => emit(AddInteractionsFailure(failure.errorMessage)),
            (message) => emit(AddInteractionsSuccess(message)),
      );
    } catch (e) {
      emit(AddInteractionsFailure("Error occurred: ${e.toString()}"));
    }
  }

}
