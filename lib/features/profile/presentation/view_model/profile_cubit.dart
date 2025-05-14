import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:greendo/core/helpers/cash_helper.dart';
import 'package:greendo/features/profile/data/repos/profile_repo_imp.dart';

import 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ProfileRepoImp profileRepoImp;

  ProfileCubit(this.profileRepoImp) : super(ProfileInitial());

  Future<void> getUserById() async {
    final cachedUser = CashHelper.getCachedUser();

    if (cachedUser != null) {
      emit(ProfileLoaded(cachedUser));
    } else {
      emit(ProfileLoading());

      final result = await profileRepoImp.getUserById();

      result.fold((failure) => emit(ProfileError(failure.errorMessage)), (
        user,
      ) {
        CashHelper.cacheUser(user);
        emit(ProfileLoaded(user));
      });
    }
  }
  Future<void> updateUserImage(File imageFile) async {
    emit(ProfileLoading());

    final result = await profileRepoImp.updateUserImage(imageFile);

    result.fold(
          (failure) => emit(ProfileError(failure.errorMessage)),
          (_) => emit(ProfileImageUpdated()),
    );
  }

}
