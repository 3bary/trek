import 'package:dartz/dartz.dart';
import 'package:greendo/features/user_preferences/data/models/user_prefs_model.dart';
import '../../../../core/cash/cash_helper.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/network/api_service.dart';

class UserPreferencesRepo {
  final IApiService _apiService;

  UserPreferencesRepo(this._apiService);
  Future<Either<Failure, void>> updateUserPreferences(UserPrefsModel userPrefsModel) async {
    try {
      var response = await _apiService.post(
        endpoint: "user/updatePreferences/${CashHelper.getCachedUser()!.id}",
        body: userPrefsModel.toJson(),
      );
      var newUserPrefs = UserPrefsModel.fromJson(response['preferences']);
      CashHelper.updateCashedUser(
              (user) => user.preferences = newUserPrefs
      );
      print(CashHelper.getCachedUser()?.preferences.toString());
      return right(null);
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }
}
