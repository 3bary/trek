import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/repos/home/home_repo_imp.dart';

part 'add_like_to_place_state.dart';

class LikePlaceCubit extends Cubit<LikePlaceState> {
  final HomeRepoImp homeRepoImp;

  LikePlaceCubit(this.homeRepoImp) : super(LikePlaceInitial());

  Future<void> likePlace(String placeId) async {
    emit(LikePlaceLoading());

    final result = await homeRepoImp.addLikeToPlace(placeId);

    result.fold(
          (failure) => emit(LikePlaceFailure(failure.errorMessage)),
          (message) => emit(LikePlaceSuccess(message)),
    );
  }
}
