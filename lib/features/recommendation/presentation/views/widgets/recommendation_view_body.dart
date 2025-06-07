import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:greendo/core/utils/app_router.dart';

import '../../../../../core/utils/constants.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../data/models/update_travel_preferences_request_body.dart';
import '../../view_model/recommendation_cubit/recommendation_cubit.dart';
import 'accessibility_selector.dart';
import 'budget_selector.dart';
import 'destination_selector.dart';
import 'group_selector.dart';
import 'month_selector.dart';

enum TravelGroup { solo, family, friends, couple }

enum BudgetLevel { low, medium, high }

enum AccessibilityOption { seniorFriendly, petFriendly, wheelchairFriendly }

extension TravelGroupLabel on TravelGroup {
  String get label {
    switch (this) {
      case TravelGroup.solo:
        return 'Solo';
      case TravelGroup.family:
        return 'Family';
      case TravelGroup.friends:
        return 'Friends';
      case TravelGroup.couple:
        return 'Couple';
    }
  }
}

extension BudgetLevelLabel on BudgetLevel {
  String get label {
    switch (this) {
      case BudgetLevel.low:
        return 'Low';
      case BudgetLevel.medium:
        return 'Medium';
      case BudgetLevel.high:
        return 'High';
    }
  }
}

extension AccessibilityOptionLabel on AccessibilityOption {
  String get label {
    switch (this) {
      case AccessibilityOption.seniorFriendly:
        return 'Senior-friendly';
      case AccessibilityOption.petFriendly:
        return 'Pet-friendly';
      case AccessibilityOption.wheelchairFriendly:
        return 'Wheelchair-friendly';
    }
  }
}

class RecommendationViewBody extends StatefulWidget {
  const RecommendationViewBody({super.key});

  @override
  State<RecommendationViewBody> createState() => _RecommendationViewBodyState();
}

class _RecommendationViewBodyState extends State<RecommendationViewBody> {
  final List<String> destinations = [
    "Cairo",
    "Giza",
    "Alexandria",
    "Qalyubia",
    "Dakahlia",
    "Beheira",
    "Gharbia",
    "Sharqia",
    "Monufia",
    "Kafr El Sheikh",
    "Damietta",
    "Port Said",
    "Ismailia",
    "Suez",
    "North Sinai",
    "South Sinai",
    "Beni Suef",
    "Faiyum",
    "Minya",
    "Asyut",
    "Sohag",
    "Qena",
    "Luxor",
    "Aswan",
    "Red Sea",
    "New Valley",
    "Matrouh",
  ];

  final List<String> months = [
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December",
  ];

  List<String> selectedDestinations = [];
  String? selectedMonth;
  TravelGroup? selectedGroup;
  List<AccessibilityOption> selectedAccessibility = [];
  BudgetLevel? selectedBudget;

  bool get isFormValid {
    return selectedDestinations.isNotEmpty &&
        selectedDestinations.length <= 3 &&
        selectedMonth != null &&
        selectedGroup != null &&
        selectedBudget != null;
  }

  void generateRecommendation() {
    if (!isFormValid) return;

    final requestBody = UpdateTravelPreferencesRequestBody(
      destinations: selectedDestinations,
      travelDates: selectedMonth!,
      groupType: selectedGroup!.label,
      accessibilityNeeds: selectedAccessibility.map((e) => e.label).toList(),
      budget: selectedBudget!.label,
    );

    context.read<RecommendationCubit>().updateTravelPreferences(requestBody);
  }

  void _showSnackBar(String message, {bool isError = false}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: isError ? Colors.red : Colors.green,
        duration: const Duration(seconds: 3),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<RecommendationCubit, RecommendationState>(
      listener: (context, state) {
        if (state is RecommendationSuccess) {
          _showSnackBar(state.message);
          // Navigate to roadmap view on success
          GoRouter.of(context).push(AppRouter.kRoadMapView);
        } else if (state is RecommendationFailure) {
          _showSnackBar(state.errorMessage, isError: true);
        }
      },
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle("1. Select up to 3 Destinations:"),
            DestinationSelector(
              destinations: destinations,
              selectedDestinations: selectedDestinations,
              onSelected: (destination) {
                setState(() {
                  selectedDestinations.add(destination);
                });
              },
              onDeselected: (destination) {
                setState(() {
                  selectedDestinations.remove(destination);
                });
              },
            ),
            _buildSectionTitle("2. When do you plan to travel?"),
            MonthSelector(
              selectedMonth: selectedMonth,
              months: months,
              onChanged: (value) {
                setState(() {
                  selectedMonth = value;
                });
              },
            ),
            _buildSectionTitle("3. What type of group are you traveling with?"),
            GroupSelector(
              selectedGroup: selectedGroup,
              onSelected: (group) {
                setState(() {
                  selectedGroup = group;
                });
              },
            ),
            _buildSectionTitle("4. Do you have any accessibility needs?"),
            AccessibilitySelector(
              selectedAccessibility: selectedAccessibility,
              onSelected: (option) {
                setState(() {
                  selectedAccessibility.add(option);
                });
              },
              onDeselected: (option) {
                setState(() {
                  selectedAccessibility.remove(option);
                });
              },
            ),
            _buildSectionTitle("5. What is your budget for this trip?"),
            BudgetSelector(
              selectedBudget: selectedBudget,
              onSelected: (budget) {
                setState(() {
                  selectedBudget = budget;
                });
              },
            ),
            const SizedBox(height: 32),
            BlocBuilder<RecommendationCubit, RecommendationState>(
              builder: (context, state) {
                final isLoading = state is RecommendationLoading;

                return SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: CustomButton(
                    onPressed:
                        (isFormValid && !isLoading)
                            ? generateRecommendation
                            : null,
                    text: isLoading ? "Updating..." : "Generate Recommendation",
                    backgroundColor:
                        (isFormValid && !isLoading)
                            ? kSecondaryColor
                            : Colors.grey.shade400,
                    textColor: Colors.white,
                  ),
                );
              },
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}
