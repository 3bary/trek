import 'package:dartz/dartz.dart';
import 'package:greendo/features/auth/data/models/user_model.dart';

import '../../../../core/errors/failures.dart';

abstract class ProfileRepo {
  Future<Either<Failure, List<UserModel>>> getUserById();
}
