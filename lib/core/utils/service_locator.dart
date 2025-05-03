import 'package:get_it/get_it.dart';
import 'package:greendo/core/network/recommendation_api_service.dart';
import 'package:greendo/features/favorites/data/repos/place_favorite_repo_imp.dart';
import '../../features/auth/data/repos/auth_repo.dart';
import '../../features/home/data/repos/home/home_repo_imp.dart';
import '../network/core_api_service.dart';
import '../network/dio_client.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  final dio = DioClient.instance;
  getIt.registerLazySingleton<HomeRepoImp>(
    () => HomeRepoImp(RecommendationApiService(dio)),
  );
  // inject AuthRepo
  getIt.registerLazySingleton<AuthRepo>(() => AuthRepo(CoreApiService(dio)));
  getIt.registerLazySingleton<FavoritePlaceRepoImp>(
    () => FavoritePlaceRepoImp(CoreApiService(dio)),
  );
}
