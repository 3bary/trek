import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:greendo/core/utils/app_router.dart';

import '../../../../../core/utils/constants.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_filter_chip.dart';
import 'custom_choice_chip.dart';

enum TravelGroup { solo, family, friends, couple }

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

enum BudgetLevel { low, medium, high }

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

enum AccessibilityOption { seniorFriendly, petFriendly, wheelchairFriendly }

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
    print("Destinations: $selectedDestinations");
    print("Month: $selectedMonth");
    print("Group: ${selectedGroup?.label}");
    print("Accessibility: ${selectedAccessibility.map((e) => e.label)}");
    print("Budget: ${selectedBudget?.label}");

    GoRouter.of(context).push(AppRouter.kRoadMapView);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "1. Select up to 3 Destinations:",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            children: destinations.map((destination) {
              final isSelected = selectedDestinations.contains(destination);
              return CustomFilterChip(
                label: Text(destination),
                isSelected: isSelected,
                onChipSelected: () {
                  setState(() {
                    if (!isSelected && selectedDestinations.length < 3) {
                      selectedDestinations.add(destination);
                    }
                  });
                },
                onChipDeselected: () {
                  setState(() {
                    selectedDestinations.remove(destination);
                  });
                },
              );
            }).toList(),
          ),
          const SizedBox(height: 24),
          const Text(
            "2. When do you plan to travel?",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          DropdownButtonFormField<String>(
            isExpanded: true,
            hint: const Text("Select Month"),
            value: selectedMonth,
            onChanged: (value) => setState(() => selectedMonth = value),
            items: months
                .map((month) => DropdownMenuItem(value: month, child: Text(month)))
                .toList(),
          ),
          const SizedBox(height: 24),
          const Text(
            "3. What type of group are you traveling with?",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            children: TravelGroup.values.map((group) {
              final isSelected = selectedGroup == group;
              return CustomChoiceChip(
                label: Text(group.label),
                isSelected: isSelected,
                onSelected: (_) => setState(() => selectedGroup = group),
              );
            }).toList(),
          ),
          const SizedBox(height: 24),
          const Text(
            "4. Do you have any accessibility needs?",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            children: AccessibilityOption.values.map((option) {
              final isSelected = selectedAccessibility.contains(option);
              return CustomFilterChip(
                isSelected: isSelected,
                label: Text(option.label),
                onChipSelected: () => setState(() => selectedAccessibility.add(option)),
                onChipDeselected: () => setState(() => selectedAccessibility.remove(option)),
              );
            }).toList(),
          ),
          const SizedBox(height: 24),
          const Text(
            "5. What is your budget for this trip?",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            children: BudgetLevel.values.map((budget) {
              final isSelected = selectedBudget == budget;
              return CustomChoiceChip(
                label: Text(budget.label),
                isSelected: isSelected,
                onSelected: (_) => setState(() => selectedBudget = budget),
              );
            }).toList(),
          ),
          const SizedBox(height: 32),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: CustomButton(
              onPressed: isFormValid ? generateRecommendation : null,
              text: "Generate Recommendation",
              backgroundColor: isFormValid ? kSecondaryColor : Colors.grey.shade400,
              textColor: Colors.white,
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}