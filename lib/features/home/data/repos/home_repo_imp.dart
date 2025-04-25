import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:greendo/core/errors/failures.dart';
import 'package:greendo/features/home/data/models/place_model.dart';
import 'package:greendo/features/home/data/repos/home_repo.dart';

import '../../../../core/utils/api_service.dart';

class HomeRepoImp implements HomeRepo {
  HomeRepoImp(this.apiService);

  final ApiService apiService;

  @override
  Future<Either<Failure, List<PlaceModel>>> getAllPlaces() async {
    try {
      var data = await apiService.get(endpoint: 'recommendations/user001');
      print('Raw API Data: $data');
      print('Type of data: ${data.runtimeType}');

      final places =
          (data['data'])
              ?.map((item) => PlaceModel.fromJson(item['place']))
              .toList() ??
          [];

      return right(places);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<PlaceModel>>> getSearchCategory(
    String category,
  ) async {
    try {
      var data = await apiService.get(
        endpoint: 'search/user001?query=$category',
      );

      final places =
          (data['data'] as List<dynamic>?)
              ?.map((item) => PlaceModel.fromJson(item['place']))
              .toList() ??
          [];

      return right(places);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
