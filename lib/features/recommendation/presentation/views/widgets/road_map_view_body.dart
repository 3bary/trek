import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:greendo/features/recommendation/presentation/views/widgets/travel_step_card.dart';
import 'package:greendo/features/recommendation/presentation/views/widgets/warnings_alert_dialog.dart';

import '../../../data/models/warning_model.dart';
import '../../view_model/recommendation_cubit/recommendation_cubit.dart';

class RoadMapViewBody extends StatefulWidget {
  const RoadMapViewBody({super.key});

  @override
  State<RoadMapViewBody> createState() => _RoadMapViewBodyState();
}

class _RoadMapViewBodyState extends State<RoadMapViewBody> {
  bool _warningsShown = false;

  @override
  void initState() {
    super.initState();
    // Generate roadmap when the widget initializes
    context.read<RecommendationCubit>().generateRoadmap();
  }

  void _showWarningsDialog(List<WarningModel> warnings) {
    if (!_warningsShown && warnings.isNotEmpty) {
      _warningsShown = true;

      WidgetsBinding.instance.addPostFrameCallback((_) {
        showDialog(
          context: context,
          builder: (context) => WarningsAlertDialog(warnings: warnings),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RecommendationCubit, RecommendationState>(
      listener: (context, state) {
        if (state is RecommendationRoadmapSuccess && state.hasWarnings) {
          _showWarningsDialog(state.warnings);
        } else if (state is RecommendationFailure) {
          // Show error snackbar
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errorMessage),
              backgroundColor: Colors.red,
              duration: const Duration(seconds: 3),
            ),
          );
        }
      },
      builder: (context, state) {
        if (state is RecommendationLoading) {
          return const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(),
                SizedBox(height: 16),
                Text(
                  'Generating your roadmap...',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          );
        }

        if (state is RecommendationFailure) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.error_outline, size: 64, color: Colors.red),
                const SizedBox(height: 16),
                Text(
                  'Failed to load roadmap',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  state.errorMessage,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.grey),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    context.read<RecommendationCubit>().generateRoadmap();
                  },
                  child: const Text('Retry'),
                ),
              ],
            ),
          );
        }

        if (state is RecommendationRoadmapSuccess) {
          if (state.travelSteps.isEmpty) {
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.map_outlined, size: 64, color: Colors.grey),
                  SizedBox(height: 16),
                  Text(
                    'No travel steps found',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Try updating your travel preferences',
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            );
          }

          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
              Row(
                children: [
                  const Text(
                    "🗺️ Your Travel Plan",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
                  if (state.hasWarnings)
                    IconButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder:
                              (context) =>
                                  WarningsAlertDialog(warnings: state.warnings),
                        );
                      },
                      icon: const Icon(
                        Icons.warning_amber,
                        color: Colors.orange,
                      ),
                      tooltip: 'View Warnings',
                    ),
                ],
              ),
              const SizedBox(height: 8),
              if (state.hasWarnings)
                Container(
                  padding: const EdgeInsets.all(12),
                  margin: const EdgeInsets.only(bottom: 16),
                  decoration: BoxDecoration(
                    color: Colors.orange.shade50,
                    border: Border.all(color: Colors.orange.shade200),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.warning_amber,
                        color: Colors.orange.shade700,
                        size: 20,
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          '${state.warnings.length} warning(s) found for your travel plan',
                          style: TextStyle(
                            color: Colors.orange.shade700,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ...state.travelSteps.asMap().entries.map((entry) {
                final index = entry.key;
                final step = entry.value;
                return Column(
                  children: [
                    TravelStepCard(step: step, stepNumber: index + 1),
                    if (index < state.travelSteps.length - 1)
                      const SizedBox(height: 16),
                  ],
                );
              }),
              const SizedBox(height: 32),
            ],
          );
        }

        // Default state (Initial)
        return const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(),
              SizedBox(height: 16),
              Text('Loading roadmap...', style: TextStyle(fontSize: 16)),
            ],
          ),
        );
      },
    );
  }
}
