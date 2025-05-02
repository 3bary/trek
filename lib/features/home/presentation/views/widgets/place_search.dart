import 'package:flutter/material.dart';

import '../../../../../core/models/place_model.dart';
import '../../../../../core/utils/constants.dart';

mixin PlaceSearch<T extends StatefulWidget> on State<T> {
  late List<PlaceModel> searchedPlaces;
  late List<PlaceModel> allPlaces;
  bool _isSearching = false;
  final TextEditingController searchTextController = TextEditingController();

  bool get isSearching => _isSearching;

  void initializeSearch(StateSetter setStateCallback, List<PlaceModel> places) {
    allPlaces = places;
    searchedPlaces = allPlaces;
  }

  void addSearchedPlacesToSearchedList(String searchPlaces) {
    searchedPlaces =
        allPlaces
            .where(
              (place) => place.name!.toLowerCase().startsWith(
                searchPlaces.toLowerCase(),
              ),
            )
            .toList();
    setState(() {});
  }

  @override
  void dispose() {
    searchTextController.dispose();
    super.dispose();
  }

  Widget buildSearchField() {
    return TextField(
      controller: searchTextController,
      cursorColor: Colors.grey,
      decoration: const InputDecoration(
        hintText: "Search for a place",
        border: InputBorder.none,
        hintStyle: TextStyle(
          color: Colors.black54,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      style: TextStyle(
        color: Colors.black54,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
      onChanged: addSearchedPlacesToSearchedList,
    );
  }

  void _startSearch(BuildContext context) {
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
      searchTextController.clear();
    });
  }

  List<Widget> buildAppBarActions(BuildContext context) {
    if (_isSearching) {
      return [
        IconButton(
          onPressed: _stopSearching,
          icon: const Icon(Icons.clear, color: kTextColor),
        ),
      ];
    } else {
      return [
        IconButton(
          onPressed: () => _startSearch(context),
          icon: const Icon(Icons.search, color: kTextColor),
        ),
      ];
    }
  }
}
