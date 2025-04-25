// import '../apis/discover_api.dart';
// import '../models/place_model.dart';
//
// class DiscoverRepo {
//   final DiscoverApi discoverApi;
//
//   DiscoverRepo(this.discoverApi);
//
//   Future<List<PlaceCardModel>> getAllPlaces() async {
//     final places = await discoverApi.getAllPlaces();
//     return places.map((place) => PlaceCardModel.fromJson(place)).toList();
//   }
//
//   Future<List<PlaceCardModel>> getPlacesByCategory(String category) async {
//     final places = await discoverApi.searchPlacesByCategory(category);
//     return places.map((place) => PlaceCardModel.fromJson(place)).toList();
//   }
// }

import 'package:dartz/dartz.dart';
import 'package:greendo/core/errors/failures.dart';
import 'package:greendo/features/home/data/models/place_model.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<PlaceModel>>> getAllPlaces();

  Future<Either<Failure, List<PlaceModel>>> getSearchCategory(
    String category,
  );
}
