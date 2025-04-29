import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:greendo/core/errors/failures.dart';
import 'package:greendo/core/network/core_api_service.dart';
import 'package:greendo/features/home/data/models/review_model.dart';
import 'package:greendo/features/home/data/repos/review/review_repo.dart';


class ReviewRepoImp implements ReviewRepo {
  ReviewRepoImp(this.reviewApiService);

  final CoreApiService reviewApiService;

  @override
  Future<Either<Failure, List<ReviewModel>>> getReviews() async {
    try {
      var data = await reviewApiService.get(endpoint: 'review/place001');

      print('Raw API Data: $data');
      print('Type of data: ${data.runtimeType}');

      final reviews =
          (data['data'] as List<dynamic>?)
              ?.map((item) => ReviewModel.fromJson(item))
              .toList() ?? [];

      return right(reviews);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
