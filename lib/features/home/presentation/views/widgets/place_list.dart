import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/app_router.dart';
import '../../../data/models/place_model.dart';

import 'placeCard.dart';

class PlaceList extends StatelessWidget {
  final TextEditingController searchTextController;
  final List<PlaceModel> allPlaces;
  final List<PlaceModel> searchedPlaces;

  const PlaceList({
    super.key,
    required this.searchTextController,
    required this.allPlaces,
    required this.searchedPlaces,
  });

  @override
  Widget build(BuildContext context) {
    final listToShow = searchTextController.text.isNotEmpty
        ? searchedPlaces
        : allPlaces;

    if (listToShow.isEmpty) {
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
        children: listToShow.map((place) {
          return SizedBox(
            width: double.infinity,
            child: PlaceCard(
              title: place.title!,
              city: place.city!,
              rating: place.rating!,
              shortDescription: place.shortDescription!,
              onDetailsPressed: () =>
                  GoRouter.of(context).push(AppRouter.kDetailView, extra: place),
            ),
          );
        }).toList(),
      ),
    );
  }
}
