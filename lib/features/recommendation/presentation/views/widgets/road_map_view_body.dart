import 'package:flutter/material.dart';
import 'package:greendo/features/recommendation/presentation/views/widgets/travel_step_card.dart';
import 'package:greendo/features/recommendation/presentation/views/widgets/warnings_alert_dialog.dart';

class RoadMapViewBody extends StatefulWidget {
  const RoadMapViewBody({super.key});

  @override
  State<RoadMapViewBody> createState() => _RoadMapViewBodyState();
}

class _RoadMapViewBodyState extends State<RoadMapViewBody> {
  bool _warningsShown = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (!_warningsShown && warnings.isNotEmpty) {
      _warningsShown = true;

      // Run after first frame
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _showWarningsDialog();
      });
    }
  }

  void _showWarningsDialog() {
    showDialog(
      context: context,
      builder: (context) => WarningsAlertDialog(),
    );
  }


  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const Text(
          "🗺️ Your Travel Plan",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        ...travelSteps.map((step) => TravelStepCard(step: step)),
      ],
    );
  }
}



class WarningMessage {
  final String warningType;
  final String message;

  WarningMessage({
    required this.warningType,
    required this.message,
  });
}

class TravelStep {
  final Place place;
  final String? nextDestination;

  TravelStep({
    required this.place,
    this.nextDestination,
  });
}

class Place {
  final String id;
  final String name;
  final String category;
  final List<String> tags;
  final String description;
  final String city;
  final String country;
  final List<String> accessibility;
  final double averageRating;
  final int likes;
  final int reviewsCount;
  final List<String> appropriateTime;
  final String budget;
  final List<String> groupType;

  Place({
    required this.id,
    required this.name,
    required this.category,
    required this.tags,
    required this.description,
    required this.city,
    required this.country,
    required this.accessibility,
    required this.averageRating,
    required this.likes,
    required this.reviewsCount,
    required this.appropriateTime,
    required this.budget,
    required this.groupType,
  });
}

final List<WarningMessage> warnings = [
  WarningMessage(
    warningType: "accessibility",
    message: "No places found matching all your accessibility needs: wheelchair-accessible. We've included places that may not fully meet your requirements.",
  ),
  WarningMessage(
    warningType: "destination",
    message: "No places found in your requested destinations: Rome, Venice, Milan. We'll include places from nearby or popular alternatives.",
  ),
];

final List<TravelStep> travelSteps = [
  TravelStep(
    place: Place(
      id: "place008",
      name: "Ahmad Orabi Museum",
      category: "historical",
      tags: ["museum", "national hero", "military", "history"],
      description: "A museum dedicated to the life and legacy of Ahmed Orabi...",
      city: "Zagazig",
      country: "Egypt",
      accessibility: ["wheelchair-friendly"],
      averageRating: 4.5,
      likes: 2800,
      reviewsCount: 670,
      appropriateTime: ["October", "November", "March"],
      budget: "low",
      groupType: ["family", "solo"],
    ),
    nextDestination: "Suez Canal",
  ),
  TravelStep(
    place: Place(
      id: "place009",
      name: "Suez Canal",
      category: "historical",
      tags: ["museum", "national hero", "military", "history"],
      description: "The Suez Canal is a navigable waterway connecting the Mediterranean Sea to the Red Sea...",
      city: "Suez",
      country: "Egypt",
      accessibility: ["wheelchair-friendly"],
      averageRating: 4.5,
      likes: 2800,
      reviewsCount: 670,
      appropriateTime: ["October", "November", "March"],
      budget: "low",
      groupType: ["family", "solo"],
    ),
  )
  // Add more TravelStep dummy data from your JSON...
];

