import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:greendo/core/utils/assets.dart';
import 'package:lottie/lottie.dart';

import '../../../../core/helpers/cash_helper.dart';
import '../../../../core/models/place_model.dart';
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
  Set<String> savedPlaceIds = {};
  List<PlaceModel> _places = [];

  @override
  void initState() {
    super.initState();
    _loadSavedPlaces();
  }

  void _loadSavedPlaces() {
    final user = CashHelper.getCachedUser();
    setState(() {
      savedPlaceIds = user?.savedPlaces?.toSet() ?? {};
    });
  }

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
                  child: Lottie.asset(loading, height: 150, width: 200),
                );
              } else if (state is FavoritePlacesLoaded) {
                if (_places.isEmpty) {
                  _places = List.from(state.places);
                }

                if (_places.isEmpty) {
                  return const Center(child: Text("No saved places yet."));
                }

                return PlaceList(
                  searchTextController: TextEditingController(),
                  allPlaces: _places,
                  searchedPlaces: _places,
                  placeId: placeId,
                  savedPlaceIds: savedPlaceIds,
                  onRemove: (String removedPlaceId) {
                    setState(() {
                      _places.removeWhere(
                        (place) => place.id == removedPlaceId,
                      );
                      savedPlaceIds.remove(removedPlaceId);
                    });
                  },
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
