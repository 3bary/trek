import '../apis/discover_api.dart';
import '../models/placeCard_model.dart';

class DiscoverRepo {
  final DiscoverApi discoverApi;

  DiscoverRepo(this.discoverApi);

  Future<List<PlaceCardModel>> getAllPlaces() async {
    final places = await DiscoverApi().getAllPlaces();
    print('Raw places: $places');
    return places.map((place) => PlaceCardModel.fromJson(place)).toList();
  }
}
