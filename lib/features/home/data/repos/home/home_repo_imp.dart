import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:greendo/core/errors/failures.dart';
import 'package:greendo/features/home/data/repos/home/home_repo.dart';

import '../../../../../core/models/place_model.dart';
import '../../../../../core/network/api_service.dart';
import '../../models/review_model.dart';

class HomeRepoImp implements HomeRepo {
  HomeRepoImp({required this.coreApiService, required this.recommendationApiService});

  final IApiService coreApiService;
  final IApiService recommendationApiService;

  @override
  Future<Either<Failure, List<PlaceModel>>> getAllPlaces() async {
    try {
      var data = await recommendationApiService.get(
        endpoint: 'recommendations/user001',
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
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<PlaceModel>>> getPlacesBySearch(
    String query,
  ) async {
    try {
      var data = await recommendationApiService.get(
        endpoint: 'search/user001?query=$query',
      );
      final places =
          (data['data'] as List<dynamic>?)
              ?.where((item) => item.containsKey('place'))
              .map((item) => PlaceModel.fromJson(item['place']))
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
  Future<Either<Failure, List<ReviewModel>>> getPlaceReviews(
    String placeId,
  ) async {
    try {
      var data = await coreApiService.get(endpoint: 'review/$placeId');
      if (data['data'] == null) {
        return left(ServerFailure('No reviews data found'));
      }
      print('Raw API Data: $data');
      print('Type of data: ${data.runtimeType}');

      final reviews =
          (data['data'] as List<dynamic>?)
              ?.map((item) => ReviewModel.fromJson(item))
              .toList() ??
          [];

      return right(reviews);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
