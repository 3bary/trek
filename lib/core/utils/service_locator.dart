import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import '../../features/home/data/repos/home/home_repo_imp.dart';
import '../network/core_api_service.dart';
import '../network/recommendation_api_service.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerLazySingleton<HomeRepoImp>(
    () => HomeRepoImp(
      coreApiService: CoreApiService(Dio(options)),
      recommendationApiService: RecommendationApiService(Dio(options)),
    ),
  );
}

BaseOptions options = BaseOptions(
  receiveDataWhenStatusError: true,
  receiveTimeout: const Duration(seconds: 100),
  connectTimeout: const Duration(seconds: 50),
);
