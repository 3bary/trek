

import 'package:dartz/dartz.dart';

import 'package:greendo/features/profile/data/repos/profile_repo.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/helpers/cash_helper.dart';
import '../../../../core/models/user_model.dart';
import '../../../../core/network/core_api_service.dart';

class ProfileRepoImp extends ProfileRepo {
  final CoreApiService coreApiService;

  ProfileRepoImp(this.coreApiService);

  @override
  Future<Either<Failure, UserModel>> getUserById() async {
    try {
      var data = await coreApiService.get(
        endpoint: 'user/${CashHelper.getCachedUser()!.id}',

      );
      final user = UserModel.fromJson(data['user']);
      return Future.value(right(user));
    } catch (e) {
      return Future.value(left(ServerFailure(e.toString())));
    }
  }


}
