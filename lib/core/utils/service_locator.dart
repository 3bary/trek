
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:greendo/core/network/recommendation_api_service.dart';

import '../../features/auth/data/repos/auth_repo.dart';
import '../../features/home/data/repos/home/home_repo_imp.dart';
import '../network/core_api_service.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerLazySingleton<HomeRepoImp>(
    () => HomeRepoImp(
      RecommendationApiService(
        Dio(options),
      ),
    ),
  );
  // inject AuthRepo
  getIt.registerLazySingleton<AuthRepo>(
    () => AuthRepo(
      CoreApiService(Dio(options)),
    ),
  );
}

BaseOptions options = BaseOptions(
  receiveDataWhenStatusError: true,
  receiveTimeout: const Duration(seconds: 60),
  connectTimeout: const Duration(seconds: 30),
);
