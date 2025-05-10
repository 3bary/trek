import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:greendo/core/errors/failures.dart';
import 'package:greendo/core/models/place_model.dart';
import 'package:greendo/features/favorites/data/repos/place_favorite_repo.dart';

import '../../../../core/helpers/cash_helper.dart';
import '../../../../core/network/api_service.dart';

class FavoritePlaceRepoImp extends FavoritePlaceRepo {
  final IApiService apiService;

  FavoritePlaceRepoImp(this.apiService);

  @override
  Future<Either<Failure, List<PlaceModel>>> getSavedPlaces() async {
    try {
      var data = await apiService.get(
        endpoint: 'user/saved-places/${CashHelper.getCachedUser()!.id}',
      );
      print('Raw API Data: $data');
      print('Type of data: ${data.runtimeType}');
      final savedPlaces =
          (data['data'] as List<dynamic>?)
              ?.map((item) => PlaceModel.fromJson(item))
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
