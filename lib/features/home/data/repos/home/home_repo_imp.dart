import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:greendo/core/errors/failures.dart';
import 'package:greendo/features/home/data/repos/home/home_repo.dart';

import '../../../../../core/helpers/cash_helper.dart';
import '../../../../../core/models/place_model.dart';
import '../../../../../core/network/api_service.dart';
import '../../models/review_model.dart';

class HomeRepoImp implements HomeRepo {
  HomeRepoImp({
    required this.coreApiService,
    required this.recommendationApiService,
  });

  final IApiService coreApiService;
  final IApiService recommendationApiService;

  @override
  Future<Either<Failure, List<PlaceModel>>> getAllPlaces() async {
    try {
      var data = await recommendationApiService.get(
        endpoint: 'recommendations/${CashHelper.getCachedUser()!.id}',
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
        endpoint: 'search/${CashHelper.getCachedUser()!.id}?query=$query',
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
      final data = await coreApiService.get(endpoint: 'review/$placeId');
      if (data['data'] == null) {
        return left(ServerFailure('No reviews data found'));
      }

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

  @override
  Future<Either<Failure, String>> addInteractionsPlace(
    String placeId,
    String interactionType,
  ) async {
    try {
      await coreApiService.post(
        endpoint: 'interaction/add',
        body: {
          'user_id': CashHelper.getCachedUser()!.id,
          'place_id': placeId,
          'interaction_type': interactionType,
        },
      );
      print('user_id: ${CashHelper.getCachedUser()?.id}');
      print('place_id: $placeId');
      print('interaction_type: $interactionType');
      print(CashHelper.getCachedUser()!.savedPlaces);
      CashHelper.updateCashedUser((user) {
        var savedPlaces = user.savedPlaces ?? [];
        savedPlaces.add(placeId);
        user.savedPlaces = savedPlaces;
      });
      print(CashHelper.getCachedUser()!.savedPlaces);
      return right('added interaction for place');
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> addInteractionsReview(
    String interactionType,
    String reviewId,
  ) async {
    try {
      await coreApiService.post(
        endpoint: 'review_interaction/add_interaction',
        body: {
          'user_id': CashHelper.getCachedUser()!.id,
          'review_id': reviewId,
          'interaction_type': interactionType,
        },
      );
      return right('added interaction for review');
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
