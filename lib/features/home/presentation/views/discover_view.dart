import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import '../../../../core/models/place_model.dart';
import '../../../../core/utils/assets.dart';
import '../view_model/home/home_cubit.dart';
import 'widgets/discover_app_bar.dart';
import '../../../../core/widgets/place_list.dart';

class DiscoverView extends StatefulWidget {
  const DiscoverView({super.key});

  @override
  State<DiscoverView> createState() => _DiscoverViewState();
}

class _DiscoverViewState extends State<DiscoverView> {
  bool _isSearching = false;
  final _searchTextController = TextEditingController();
  List<PlaceModel> _searchedPlaces = [];
  Timer? _debounceTimer;
  String _lastSearchQuery = '';
  String placeId = '';

  @override
  void initState() {
    super.initState();
    context.read<HomeCubit>().fetchAllPlaces();
  }

  @override
  void dispose() {
    _debounceTimer?.cancel();
    _searchTextController.dispose();
    super.dispose();
  }

  void _handleSearch(String query) {
    _debounceTimer?.cancel();

    if (query.isEmpty) {
      setState(() => _searchedPlaces = []);
      context.read<HomeCubit>().fetchAllPlaces();
      _lastSearchQuery = '';
      return;
    }

    _debounceTimer = Timer(const Duration(milliseconds: 500), () {
      if (query != _lastSearchQuery) {
        _lastSearchQuery = query;
        context.read<HomeCubit>().getPlacesBySearch(query);
      }
    });
  }

  void _startSearch() {
    ModalRoute.of(
      context,
    )!.addLocalHistoryEntry(LocalHistoryEntry(onRemove: _stopSearching));
    setState(() => _isSearching = true);
  }

  void _stopSearching() {
    _debounceTimer?.cancel();
    setState(() {
      _isSearching = false;
      _searchTextController.clear();
      _lastSearchQuery = '';
    });
    context.read<HomeCubit>().fetchAllPlaces();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DiscoverAppBar(
        isSearching: _isSearching,
        searchTextController: _searchTextController,
        onChanged: _handleSearch,
        onStartSearch: _startSearch,
        onStopSearch: _stopSearching,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 3),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 5),
            Expanded(
              child: BlocConsumer<HomeCubit, HomeState>(
                listener: (context, state) {
                  if (state is HomeLoaded && _isSearching) {
                    _searchedPlaces = state.places;
                  }
                },
                builder: (context, state) {
                  if (state is HomeLoading) {
                    return Center(
                      child: Lottie.asset(loading, height: 200, width: 200),
                    );
                  } else if (state is HomeLoaded) {
                    return PlaceList(
                      searchTextController: _searchTextController,
                      allPlaces: state.places,
                      searchedPlaces:
                          _isSearching ? _searchedPlaces : state.places,
                      placeId: placeId,
                    );
                  } else if (state is HomeError) {
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
