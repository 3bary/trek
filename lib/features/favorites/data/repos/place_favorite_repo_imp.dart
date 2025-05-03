import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:greendo/core/errors/failures.dart';
import 'package:greendo/core/models/place_model.dart';
import 'package:greendo/core/network/core_api_service.dart';
import 'package:greendo/features/favorites/data/repos/place_favorite_repo.dart';

class FavoritePlaceRepoImp extends FavoritePlaceRepo {
  final CoreApiService coreApiService;

  FavoritePlaceRepoImp(this.coreApiService);

  @override
  Future<Either<Failure, List<PlaceModel>>> getSavedPlaces() async {
    try {
      var data = await coreApiService.get(endpoint: 'saved-places/user002');
      print('Raw API Data: $data');
      print('Type of data: ${data.runtimeType}');
      final savedPlaces =
          (data['data'] as List<dynamic>?)
              ?.map((item) => PlaceModel.fromJson(item['place']))
              .toList() ??
          [];

      return right(savedPlaces);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
