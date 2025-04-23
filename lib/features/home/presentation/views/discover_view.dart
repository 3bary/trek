import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:greendo/features/home/data/models/placeCard_model.dart';
import 'package:greendo/features/home/presentation/views/widgets/category_list.dart';
import '../../../../core/utils/assets.dart';
import '../view_model/discover/discover_cubit.dart';
import '../view_model/discover/discover_state.dart';
import 'widgets/discover_app_bar.dart';
import 'widgets/place_list.dart';
import 'package:lottie/lottie.dart';

class DiscoverView extends StatefulWidget {
  const DiscoverView({super.key});

  @override
  State<DiscoverView> createState() => _DiscoverViewState();
}

class _DiscoverViewState extends State<DiscoverView> {
  late List<PlaceCardModel> searchedPlaces;
  late List<PlaceCardModel> allPlaces;
  bool _isSearching = false;
  final _searchTextController = TextEditingController();

  @override
  void initState() {
    super.initState();
    searchedPlaces = [];
    context.read<DiscoverCubit>().getAllPlaces();
  }

  void addSearchedPlacesToSearchedList(String searchPlaces) {
    setState(() {
      searchedPlaces =
          allPlaces
              .where(
                (place) =>
            place.title?.toLowerCase().startsWith(
              searchPlaces.toLowerCase(),
            ) ??
                false,
          )
              .toList();
    });
  }

  void _startSearch() {
    ModalRoute.of(
      context,
    )!.addLocalHistoryEntry(LocalHistoryEntry(onRemove: _stopSearching));
    setState(() => _isSearching = true);
  }

  void _stopSearching() {
    setState(() {
      _isSearching = false;
      _searchTextController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DiscoverAppBar(
        isSearching: _isSearching,
        searchTextController: _searchTextController,
        onChanged: addSearchedPlacesToSearchedList,
        onStartSearch: _startSearch,
        onStopSearch: _stopSearching,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 3),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CategoryNamesList(),
            const SizedBox(height: 5),
            Expanded(
              child: BlocBuilder<DiscoverCubit, DiscoverState>(
                builder: (context, state) {
                  if (state is DiscoverLoading) {
                    return Center(
                      child: Lottie.asset(loading, height: 250, width: 250),
                    );
                  } else if (state is DiscoverLoaded) {
                    allPlaces = state.places;
                    print('Loaded places: ${allPlaces.length}');
                    searchedPlaces =
                    _searchTextController.text.isEmpty
                        ? allPlaces
                        : allPlaces
                        .where(
                          (place) =>
                      place.title?.toLowerCase().startsWith(
                        _searchTextController.text
                            .toLowerCase(),
                      ) ??
                          false,
                    )
                        .toList();

                    return PlaceList(
                      searchTextController: _searchTextController,
                      allPlaces: allPlaces,
                      searchedPlaces: searchedPlaces,
                    );
                  } else if (state is DiscoverError) {
                    return Center(child: Text('Error: ${state.message}'));
                  } else {
                    return const SizedBox();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}