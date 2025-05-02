import 'package:dio/dio.dart';

import 'package:get_it/get_it.dart';
import 'package:greendo/core/network/recommendation_api_service.dart';
import '../../features/auth/data/repos/auth_repo.dart';
import '../../features/home/data/repos/home/home_repo_imp.dart';
import '../network/core_api_service.dart';
import '../network/recommendation_api_service.dart';
import '../network/dio_client.dart';
import '../network/core_api_service.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  final dio = DioClient.instance;
  getIt.registerLazySingleton<HomeRepoImp>(
    () => HomeRepoImp(
      coreApiService: CoreApiService(Dio(options)),
      recommendationApiService: RecommendationApiService(Dio(options)),
    ),
  );
  // inject AuthRepo
  getIt.registerLazySingleton<AuthRepo>(
    () => AuthRepo(
      CoreApiService(dio),
    ),
  );
}