import 'package:dartz/dartz.dart';
import 'package:greendo/features/profile/data/repos/profile_repo.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/helpers/cash_helper.dart';
import '../../../../core/models/user_model.dart';
import '../../../../core/network/api_service.dart';

class ProfileRepoImp extends ProfileRepo {
  final IApiService apiService;

  ProfileRepoImp(this.apiService);

  @override
  Future<Either<Failure, UserModel>> getUserById() async {
    try {
      var data = await apiService.get(
        endpoint: 'user/${CashHelper.getCachedUser()!.id}',
      );
      final user = UserModel.fromJson(data['user']);
      return Future.value(right(user));
    } catch (e) {
      return Future.value(left(ServerFailure(e.toString())));
    }
  }
}
