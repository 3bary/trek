import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:greendo/core/utils/app_router.dart';

import '../../../../../core/utils/constants.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_filter_chip.dart';
import 'custom_choice_chip.dart';

class RecommendationViewBody extends StatefulWidget {
  const RecommendationViewBody({super.key});

  @override
  State<RecommendationViewBody> createState() => _RecommendationViewBodyState();
}

class _RecommendationViewBodyState extends State<RecommendationViewBody> {

  final List<String> destinations = [
    "Nice",
    "Ajaccio",
    "Fontainebleau",
    "Arles",
    "Lyon",
    "Reims",
    "Marseille",
    "Rouen",
    "Chenonceaux",
    "Marne-la-Vallée",
    "Saumur",
    "Carcassonne",
    "Toulouse",
    "Orschwiller",
    "Les Epesses",
    "Biarritz",
    "Normandy",
    "Strasbourg",
    "Bordeaux",
    "Alsace",
    "Vers-Pont-du-Gard",
    "Étretat",
    "Loir-et-Cher",
    "Provence",
    "Paris",
    "Versailles",
    "Saint-Malo",
  ];

  final List<String> months = [
    "Now",
    "January 2025",
    "February 2025",
    "March 2025",
    "April 2025",
    "May 2025",
    "June 2025",
    "July 2025",
    "August 2025",
    "September 2025",
    "October 2025",
    "November 2025",
    "December 2025",
  ];

  final List<String> groups = ["Solo", "Family", "Friends", "Couple"];

  final List<String> accessibilityOptions = [
    "Senior-friendly",
    "Pet-friendly",
    "Wheelchair-friendly",
  ];

  final List<String> budgets = ["Low", "Medium", "High"];

  List<String> selectedDestinations = [];

  String? selectedMonth;

  String? selectedGroup;

  List<String> selectedAccessibility = [];

  String? selectedBudget;

  void generateRecommendation() {
    // You can handle recommendation logic here based on the selections
    print("Destinations: $selectedDestinations");
    print("Month: $selectedMonth");
    print("Group: $selectedGroup");
    print("Accessibility: $selectedAccessibility");
    print("Budget: $selectedBudget");
    GoRouter.of(context).push( AppRouter.kRoadMapView);
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
            children:
            destinations.map((destination) {
              bool isSelected = selectedDestinations.contains(destination);
              return CustomFilterChip(
                label: Text(destination),
                isSelected: isSelected,
                onChipSelected: () {
                  setState(() {
                      if (selectedDestinations.length < 3) {
                        selectedDestinations.add(destination);
                      }
                    }
                  );
                }, onChipDeselected: () {
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
            items:
            months
                .map(
                  (month) =>
                  DropdownMenuItem(value: month, child: Text(month)),
            )
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
            children:
            groups.map((group) {
              bool isSelected = selectedGroup == group;
              return CustomChoiceChip(
                label: Text(group),
                isSelected: isSelected,
                onSelected: (_) {
                  setState(() {
                    selectedGroup = group;
                  });
                },
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
            children:
            accessibilityOptions.map((option) {
              bool isSelected = selectedAccessibility.contains(option);
              return CustomFilterChip(
                  isSelected: isSelected,
                  label:  Text(option),
                  onChipSelected: () {
                    setState(() {
                      selectedAccessibility.add(option);
                    });
                  },
                  onChipDeselected: () {
                    setState(() {
                      selectedAccessibility.remove(option);
                    });
                  });
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
            children:
            budgets.map((budget) {
              bool isSelected = selectedBudget == budget;
              return CustomChoiceChip(
                label: Text(budget),
                isSelected: isSelected,
                onSelected: (_) {
                  setState(() {
                    selectedBudget = budget;
                  });
                },
              );
            }).toList(),
          ),
          const SizedBox(height: 32),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: CustomButton(
              onPressed: generateRecommendation,
              text: "Generate Recommendation",
              backgroundColor: kSecondaryColor,
              textColor: Colors.white,
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
