import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:greendo/features/user_preferences/data/models/user_prefs_model.dart';
import 'package:greendo/features/user_preferences/data/repos/user_preferences_repo.dart';

// States
part 'user_prefs_state.dart';

class UserPrefsCubit extends Cubit<UserPrefsState> {
  final UserPreferencesRepo _repo;

  UserPrefsCubit(this._repo) : super(UserPrefsInitial());

  Future<void> updateUserPreferences(UserPrefsModel prefs) async {
    emit(UserPrefsLoading());
    final result = await _repo.updateUserPreferences(prefs);
    result.fold(
          (failure) => emit(UserPrefsFailure(failure.errorMessage)),
          (_) => emit(UserPrefsSuccess()),
    );
  }
}
