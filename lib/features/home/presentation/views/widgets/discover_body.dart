import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:greendo/features/home/data/models/placeCard_model.dart';
import 'package:greendo/features/home/presentation/views/widgets/placeCard.dart';

import '../../../../../core/utils/app_router.dart';

class DiscoverBody extends StatelessWidget {
  final List<PlaceCardModel> places;
  final BuildContext context;

  const DiscoverBody({super.key, required this.places, required this.context});

  @override
  Widget build(BuildContext context) {
    if (places.isEmpty) {
      return const Center(
        child: Text(
          'No place found!',
          style: TextStyle(
            color: Colors.grey,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
    }

    return SingleChildScrollView(
      child: Wrap(
        children:
            places.map((place) {
              return SizedBox(
                width: double.infinity,
                child: PlaceCard(
                  title: place.title!,
                  city: place.city!,
                  rating: place.rating!,
                  shortDescription: place.shortDescription!,
                  onDetailsPressed: () {
                    GoRouter.of(
                      context,
                    ).push(AppRouter.kDetailView, extra: place);
                  },
                ),
              );
            }).toList(),
      ),
    );
  }
}
