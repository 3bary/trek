part of 'recommendation_cubit.dart';

abstract class RecommendationState extends Equatable {
  const RecommendationState();

  @override
  List<Object> get props => [];
}

class RecommendationInitial extends RecommendationState {}

class RecommendationLoading extends RecommendationState {}

class RecommendationSuccess extends RecommendationState {
  final String message;

  const RecommendationSuccess(this.message);

  @override
  List<Object> get props => [message];
}

class RecommendationFailure extends RecommendationState {
  final String errorMessage;

  const RecommendationFailure(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}

class RecommendationRoadmapSuccess extends RecommendationState {
  final List<TravelStepModel> travelSteps;
  final List<WarningModel> warnings;
  final bool hasWarnings;

  const RecommendationRoadmapSuccess({
    required this.travelSteps,
    required this.warnings,
    required this.hasWarnings,
  });

  @override
  List<Object> get props => [travelSteps, warnings, hasWarnings];
}
