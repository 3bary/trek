import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';


import '../../../../../core/models/place_model.dart';
import '../../../../../core/utils/app_router.dart';
import '../../../../../core/utils/service_locator.dart';
import '../../../../../core/widgets/place_card.dart';
import '../../../data/repos/home/home_repo_imp.dart';
import '../../view_model/add_interactions/add_interactions_cubit.dart';


class PlaceList extends StatelessWidget {
  final TextEditingController searchTextController;
  final List<PlaceModel> allPlaces;
  final List<PlaceModel> searchedPlaces;
  final String placeId;

  const PlaceList({
    super.key,
    required this.searchTextController,
    required this.allPlaces,
    required this.searchedPlaces,
    required this.placeId,
  });

  @override
  Widget build(BuildContext context) {
    final listToShow =
        searchTextController.text.isNotEmpty ? searchedPlaces : allPlaces;


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

    return BlocProvider(
      create:
          (context) => AddInteractionsCubit(
            getIt<HomeRepoImp>()..addInteractions(placeId, 'save'),
          ),
      child: ListView(
        children:
            listToShow.map((place) {
              return SizedBox(
                width: double.infinity,
                child: PlaceCard(
                  placeId: place.id ?? '',
                  likes: place.likes!,
                  title: place.name!,
                  city: place.location!.city!,
                  rating: place.averageRating!,
                  description: place.description!,
                  onDetailsPressed: () {
                    context.read<AddInteractionsCubit>().viewPlace(
                      place.id ?? '',
                      'view',
                    );
                    GoRouter.of(
                      context,
                    ).push(AppRouter.kPlaceDetailsView, extra: place);
                  },

                ),
              );
            }).toList(),
      ),
    );
  }
}
