import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:greendo/features/home/data/models/placeCard_model.dart';
import 'package:greendo/features/home/presentation/views/widgets/placeCard.dart';

import '../../../../core/utils/app_router.dart';
import '../../../../core/utils/constants.dart';

class DiscoverView extends StatefulWidget {
  const DiscoverView({super.key});

  @override
  _DiscoverViewState createState() => _DiscoverViewState();
}

class _DiscoverViewState extends State<DiscoverView> {
  late List<PlaceCardModel> searchedPlaces;
  late List<PlaceCardModel> allPlaces;
  bool _isSearching = false;
  final _searchTextController = TextEditingController();

  @override
  void initState() {
    super.initState();
    allPlaces =
        AppConstants.places;
    searchedPlaces = allPlaces;
  }

  void addSearchedPlacesToSearchedList(String searchPlaces) {
    searchedPlaces =
        allPlaces
            .where(
              (place) => place.title!.toLowerCase().startsWith(
                searchPlaces.toLowerCase(),
              ),
            )
            .toList();
    setState(() {});
  }

  Widget _buildSearchField() {
    return TextField(
      controller: _searchTextController,
      cursorColor: Colors.grey,
      decoration: InputDecoration(
        hintText: ("Search for a place"),
        border: InputBorder.none,
        hintStyle: TextStyle(
          color: Colors.grey,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      style: TextStyle(
        color: Colors.grey,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
      onChanged: (searchPlaces) {
        addSearchedPlacesToSearchedList(searchPlaces);
      },
    );
  }

  void _startSearch() {
    ModalRoute.of(
      context,
    )!.addLocalHistoryEntry(LocalHistoryEntry(onRemove: _stopSearching));
    setState(() {
      _isSearching = true;
    });
  }

  void _stopSearching() {
    setState(() {
      _isSearching = false;
      _searchTextController.clear();
    });
  }

  List<Widget> _buildAppBarAction() {
    if (_isSearching) {
      return [
        IconButton(
          onPressed: () {
            _stopSearching();
          },
          icon: Icon(Icons.clear, color: Colors.grey),
        ),
      ];
    } else {
      return [
        IconButton(
          onPressed: _startSearch,
          icon: Icon(Icons.search, color: Colors.grey),
        ),
      ];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: kPrimaryColor,
        title:
            _isSearching
                ? _buildSearchField()
                : Text("Discover", style: TextStyle(color: Colors.grey)),
        actions: _buildAppBarAction(),
      ),
      body: Padding(padding: EdgeInsets.only(top: 3), child: _buildPlaceList()),
    );
  }

  Widget _buildPlaceList() {
    final listToShow =
        _searchTextController.text.isNotEmpty ? searchedPlaces : allPlaces;

    if (listToShow.isEmpty) {
      return Center(
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
            listToShow.map((place) {
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
