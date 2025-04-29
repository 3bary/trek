import 'package:flutter/material.dart';
import 'package:greendo/features/recommendation/presentation/views/widgets/road_map_view_body.dart';

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
