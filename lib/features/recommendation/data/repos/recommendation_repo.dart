import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/helpers/cash_helper.dart';
import '../../../../core/network/api_service.dart';
import '../models/travel_step_model.dart';
import '../models/update_travel_preferences_request_body.dart';
import '../models/warning_model.dart';

class RecommendationRepo {
  final IApiService _coreApiService;
  final IApiService _recommendationApiService;

  RecommendationRepo(this._coreApiService, this._recommendationApiService);

  Future<Either<Failure, void>> updateTravelPreferences(
    UpdateTravelPreferencesRequestBody updateTravelPreferencesRequestBody,
  ) async {
    try {
      final response = await _coreApiService.put(
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

  Future<Either<Failure, Map<String, dynamic>>> generateRoadmap() async {
    try {
      final response = await _recommendationApiService.get(
        endpoint: "roadmap/${CashHelper.getCachedUser()!.id}",
      );

      // Parse the response
      final data = response['data'];
      final messageData = data['message'];

      // Extract warnings
      List<WarningModel> warnings = [];
      if (messageData['is_warning'] == true &&
          messageData['warnings'] != null) {
        warnings =
            (messageData['warnings'] as List)
                .map((warning) => WarningModel.fromJson(warning))
                .toList();
      }

      // Extract travel steps (places data)
      List<TravelStepModel> travelSteps = [];
      if (data['data'] != null) {
        travelSteps =
            (data['data'] as List)
                .map((stepData) => TravelStepModel.fromJson(stepData))
                .toList();
      }

      // Return structured data
      return right({
        'warnings': warnings,
        'travelSteps': travelSteps,
        'warningCount': messageData['count'] ?? 0,
        'hasWarnings': messageData['is_warning'] ?? false,
      });
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
