import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:greendo/features/user_preferences/data/models/user_prefs_model.dart';
import '../../../../core/cash/cash_helper.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/network/api_service.dart';

class UserPreferencesRepo {
  final IApiService _apiService;

  UserPreferencesRepo(this._apiService);
  Future<Either<Failure, void>> updateUserPreferences(UserPrefsModel userPrefsModel) async {
    try {
      var response = await _apiService.put(
        endpoint: "user/updatePreferences/${CashHelper.getCachedUser()!.id}",
        body: {
          "preferences": userPrefsModel.toJson()
        },
      );
      print('cashed user: ${CashHelper.getCachedUser()!.id}');
      UserPrefsModel newUserPrefs = UserPrefsModel.fromJson(response['preferences']);
      CashHelper.updateCashedUser(
              (user) => user.preferences = newUserPrefs
      );
      print(CashHelper.getCachedUser()?.preferences!.tags);
      print(CashHelper.getCachedUser()?.preferences!.categories);
      return right(null);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
