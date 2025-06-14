import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/travel_step_model.dart';
import '../../../data/models/update_travel_preferences_request_body.dart';
import '../../../data/models/warning_model.dart';
import '../../../data/repos/recommendation_repo.dart';

part 'recommendation_state.dart';

class RecommendationCubit extends Cubit<RecommendationState> {
  final RecommendationRepo _recommendationRepo;

  RecommendationCubit(this._recommendationRepo)
    : super(RecommendationInitial());

  Future<void> updateTravelPreferences(
    UpdateTravelPreferencesRequestBody requestBody,
  ) async {
    emit(RecommendationLoading());

    final result = await _recommendationRepo.updateTravelPreferences(
      requestBody,
    );

    result.fold(
      (failure) => emit(RecommendationFailure(failure.errorMessage)),
      (success) => emit(
        const RecommendationSuccess('Travel preferences updated successfully!'),
      ),
    );
  }

  Future<void> generateRoadmap() async {
    emit(RecommendationLoading());

    final result = await _recommendationRepo.generateRoadmap();

    result.fold(
      (failure) => emit(RecommendationFailure(failure.errorMessage)),
      (success) {
        final warnings = success['warnings'] as List<WarningModel>;
        final travelSteps = success['travelSteps'] as List<TravelStepModel>;
        final hasWarnings = success['hasWarnings'] as bool;

        emit(
          RecommendationRoadmapSuccess(
            travelSteps: travelSteps,
            warnings: warnings,
            hasWarnings: hasWarnings,
          ),
        );
      },
    );
  }

  // Helper method to update preferences from UI state directly
  Future<void> updateTravelPreferencesFromUI({
    required List<String> selectedDestinations,
    required String selectedMonth,
    required String groupType,
    required List<String> accessibilityNeeds,
    required String budget,
  }) async {
    final requestBody = UpdateTravelPreferencesRequestBody(
      destinations: selectedDestinations,
      travelDates: selectedMonth,
      groupType: groupType,
      accessibilityNeeds: accessibilityNeeds,
      budget: budget,
    );

    await updateTravelPreferences(requestBody);
  }

  void resetState() {
    emit(RecommendationInitial());
  }
}
