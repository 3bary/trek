import '../apis/discover_api.dart';
import '../models/placeCard_model.dart';

class DiscoverRepo {
  final DiscoverApi discoverApi;

  DiscoverRepo(this.discoverApi);

  Future<List<PlaceCardModel>> getAllPlaces() async {
    final places = await discoverApi.getAllPlaces();
    return places.map((place) => PlaceCardModel.fromJson(place)).toList();
  }

  Future<List<PlaceCardModel>> getPlacesByCategory(String category) async {
    final places = await discoverApi.searchPlacesByCategory(category);
    return places.map((place) => PlaceCardModel.fromJson(place)).toList();
  }
}
