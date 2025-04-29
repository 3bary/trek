import 'package:dartz/dartz.dart';

import '../../../../../core/errors/failures.dart';
import '../../models/review_model.dart';

abstract class ReviewRepo {
  Future<Either<Failure, List<ReviewModel>>> getReviews();

}