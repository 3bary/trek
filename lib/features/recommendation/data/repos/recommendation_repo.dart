import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/helpers/cash_helper.dart';
import '../../../../core/network/api_service.dart';
import '../models/update_travel_preferences_request_body.dart';

class RecommendationRepo {
  final IApiService _apiService;
  RecommendationRepo(this._apiService);

  Future<Either<Failure, void>> updateTravelPreferences(
    UpdateTravelPreferencesRequestBody updateTravelPreferencesRequestBody,
  ) async {
    try {
      final response = await _apiService.put(
        endpoint:
            "user_travel_preferences/update/${CashHelper.getCachedUser()!.id}",
        body: updateTravelPreferencesRequestBody.toJson(),
      );
      print("API Response: ${response['message']}");
      return right(null);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  Future<Either<Failure, void>> generateRoadMap() async {
    try {
      final response = await _apiService.get(
        endpoint: "roadmap/${CashHelper.getCachedUser()!.id}",
      );
      print("API Response: ${response['message']}");
      return right(null);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
