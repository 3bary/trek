import 'package:dartz/dartz.dart';
import 'package:greendo/core/errors/failures.dart';
import '../../../../../core/models/place_model.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<PlaceModel>>> getAllPlaces();

  Future<Either<Failure, List<PlaceModel>>> getSearchCategory(
    String category,
  );
}
