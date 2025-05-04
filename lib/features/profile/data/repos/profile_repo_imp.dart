import 'package:dartz/dartz.dart';
import 'package:greendo/features/profile/data/repos/profile_repo.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/network/api_service.dart';
import '../../../auth/data/models/user_model.dart';

class ProfileRepoImp extends ProfileRepo {
  final IApiService apiService;

  ProfileRepoImp(this.apiService);

  @override
  Future<Either<Failure, List<UserModel>>> getUserById() async {
    try {
      var data = await apiService.get(endpoint: 'user/user001');
      print('Raw API Data: $data');
      print('Type of data: ${data.runtimeType}');
      final users =
          (data['data'] as List<dynamic>?)
              ?.map((item) => UserModel.fromJson(item))
              .toList() ??
          [];
      return Future.value(right(users));
    } catch (e) {
      return Future.value(left(ServerFailure(e.toString())));
    }
  }
}
