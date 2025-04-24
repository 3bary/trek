import 'package:bookly_app/features/home/data/repos/home_repo_impl.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'api_service.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<HomeRepoImpl>(
    HomeRepoImpl(
      ApiService(
        Dio(options),
      ),
    ),
  );
}

BaseOptions options = BaseOptions(
  receiveDataWhenStatusError: true,
  receiveTimeout: const Duration(seconds: 60),
  connectTimeout: const Duration(seconds: 30),
);
