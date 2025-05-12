import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/models/place_model.dart';

abstract class FavoritePlaceRepo{
  Future<Either<Failure, List<PlaceModel>>> getSavedPlaces();
}