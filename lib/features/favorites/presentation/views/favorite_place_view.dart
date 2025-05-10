import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:greendo/core/utils/assets.dart';
import 'package:lottie/lottie.dart';
import '../../../../core/utils/constants.dart';

import '../../../../core/utils/service_locator.dart';
import '../../../../core/widgets/place_list.dart';
import '../view_model/favorite_places_cubit.dart';

class FavoritePlaceView extends StatefulWidget {
  const FavoritePlaceView({super.key});

  @override
  State<FavoritePlaceView> createState() => _FavoritePlaceViewState();
}

class _FavoritePlaceViewState extends State<FavoritePlaceView> {
  String placeId = '';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<FavoritePlacesCubit>()..getSavedPlaces(),
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: kPrimaryColor,
            title: const Text(
              'Saved Places',
              style: TextStyle(color: Colors.black54),
            ),
          ),
          body: BlocBuilder<FavoritePlacesCubit, FavoritePlacesState>(
            builder: (context, state) {
              if (state is FavoritePlacesLoading) {
                return Center(
                  child: Lottie.asset(loading, height: 200, width: 200),
                );
              } else if (state is FavoritePlacesLoaded) {
                final savedPlaces = state.places;

                if (savedPlaces.isEmpty) {
                  return const Center(child: Text("No saved places yet."));
                }
                return PlaceList(
                  searchTextController: TextEditingController(),
                  allPlaces: savedPlaces,
                  searchedPlaces: savedPlaces,
                  placeId: placeId,
                );
              } else if (state is FavoritePlacesError) {
                return Center(child: Text('Error: ${state.message}'));
              } else {
                return const SizedBox();
              }
            },
          ),
        ),
      ),
    );
  }
}
