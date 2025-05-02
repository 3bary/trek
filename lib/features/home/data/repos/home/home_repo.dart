import 'package:dartz/dartz.dart';
import '../../../../../core/errors/failures.dart';
import '../../../../../core/models/place_model.dart';
import '../../models/review_model.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<PlaceModel>>> getAllPlaces();
  Future<Either<Failure, List<PlaceModel>>> getPlacesBySearch(String query);
  Future<Either<Failure, List<ReviewModel>>> getPlaceReviews(String placeId);
}