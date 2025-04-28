import 'package:flutter/material.dart';

import '../../../../../core/utils/constants.dart';

class RoadMapViewBody extends StatelessWidget {
  const RoadMapViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Road Map'),
        backgroundColor: kPrimaryColor,
      ),
      body: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            // Show Warnings
            if (warnings.isNotEmpty)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "⚠️ Warnings",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.redAccent),
                  ),
                  const SizedBox(height: 8),
                  ...warnings.map((warning) => Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Text(
                      warning.message,
                      style: const TextStyle(color: Colors.black87),
                    ),
                  )).toList(), // ف,
                  const Divider(),
                ],
              ),
            // Show Travel Steps
            const Text(
              "🗺️ Your Travel Plan",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            ...travelSteps.map((step) => TravelStepCard(step: step)).toList(),
          ],
        ),
    );
  }
}

class TravelStepCard extends StatelessWidget {
  final TravelStep step;

  const TravelStepCard({super.key, required this.step});

  @override
  Widget build(BuildContext context) {
    final place = step.place;
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(place.name, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text(place.description),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              children: place.tags.map((tag) => Chip(label: Text(tag))).toList(),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(Icons.location_on, size: 16),
                const SizedBox(width: 4),
                Text("${place.city}, ${place.country}"),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(Icons.star, size: 16, color: Colors.amber),
                const SizedBox(width: 4),
                Text("${place.averageRating}"),
                const SizedBox(width: 8),
                Text("${place.reviewsCount} reviews"),
              ],
            ),
            const SizedBox(height: 12),
            if (step.nextDestination != null)
              Text(
                "Next: ${step.nextDestination!}",
                style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.blueAccent),
              ),
          ],
        ),
      ),
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

