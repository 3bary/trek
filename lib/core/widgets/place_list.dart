import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/home/data/repos/home/home_repo_imp.dart';
import '../../features/home/presentation/view_model/add_interactions/add_interactions_cubit.dart';
import '../models/place_model.dart';
import '../utils/service_locator.dart';
import 'place_card.dart';

class PlaceList extends StatelessWidget {
  final TextEditingController searchTextController;
  final List<PlaceModel> allPlaces;
  final List<PlaceModel> searchedPlaces;
  final String placeId;
  final Set<String> savedPlaceIds;
  final void Function(String placeId)? onRemove;

  const PlaceList({
    super.key,
    required this.searchTextController,
    required this.allPlaces,
    required this.searchedPlaces,
    required this.placeId,
    required this.savedPlaceIds,
    this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    final listToShow =
        searchTextController.text.isNotEmpty ? searchedPlaces : allPlaces;

    if (listToShow.isEmpty) {
      return const Center(
        child: Text(
          'No Saved Places!',
          style: TextStyle(
            color: Colors.grey,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
    }

    return BlocProvider(
      create:
          (context) => AddInteractionsCubit(
            getIt<HomeRepoImp>()..addInteractionsPlace(placeId, 'save'),
          ),
      child: ListView(
        children:
            listToShow.map((place) {
              return SizedBox(
                width: double.infinity,
                child: PlaceCard(
                  key: ValueKey(place.id),
                  place: place,
                  savedPlaceIds: savedPlaceIds,
                  onRemove: onRemove,
                ),
              );
            }).toList(),
      ),
    );
  }
}
