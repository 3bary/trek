import 'package:flutter/material.dart';
import 'package:greendo/features/home/data/models/place_model.dart';

mixin PlaceSearch<T extends StatefulWidget> on State<T> {
  late List<PlaceModel> searchedPlaces;
  late List<PlaceModel> allPlaces;
  bool _isSearching = false;
  final TextEditingController searchTextController = TextEditingController();

  bool get isSearching => _isSearching;

  void initializeSearch(
    StateSetter setStateCallback,
    List<PlaceModel> places,
  ) {
    allPlaces = places;
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

  Widget buildSearchField() {
    return TextField(
      controller: searchTextController,
      cursorColor: Colors.grey,
      decoration: const InputDecoration(
        hintText: "Search for a place",
        border: InputBorder.none,
        hintStyle: TextStyle(
          color: Colors.grey,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      style: const TextStyle(
        color: Colors.grey,
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
          icon: const Icon(Icons.clear, color: Colors.black54),
        ),
      ];
    } else {
      return [
        IconButton(
          onPressed: () => _startSearch(context),
          icon: const Icon(Icons.search, color: Colors.black54),
        ),
      ];
    }
  }
}
