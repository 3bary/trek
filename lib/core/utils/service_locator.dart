import 'package:get_it/get_it.dart';
import 'package:greendo/core/network/recommendation_api_service.dart';
import 'package:greendo/features/favorites/data/repos/place_favorite_repo_imp.dart';
import 'package:greendo/features/user_preferences/data/repos/user_preferences_repo.dart';

import '../../features/auth/data/repos/auth_repo.dart';
import '../../features/favorites/presentation/view_model/favorite_places_cubit.dart';
import '../../features/home/data/repos/home/home_repo_imp.dart';
import '../../features/profile/data/repos/profile_repo_imp.dart';
import '../../features/profile/presentation/view_model/profile/profile_cubit.dart';
import '../network/core_api_service.dart';
import '../network/dio_client.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  final dio = DioClient.instance;
  getIt.registerLazySingleton<HomeRepoImp>(
    () => HomeRepoImp(
      coreApiService: CoreApiService(dio),
      recommendationApiService: RecommendationApiService(dio),
    ),
  );
  // inject AuthRepo
  getIt.registerLazySingleton<AuthRepo>(() => AuthRepo(CoreApiService(dio)));
  getIt.registerLazySingleton<FavoritePlaceRepoImp>(
    () => FavoritePlaceRepoImp(CoreApiService(dio)),
  );
  getIt.registerFactory<FavoritePlacesCubit>(
    () => FavoritePlacesCubit(getIt<FavoritePlaceRepoImp>()),
  );
  getIt.registerLazySingleton<UserPreferencesRepo>(
    () => UserPreferencesRepo(CoreApiService(dio)),
  );
  getIt.registerLazySingleton<ProfileRepoImp>(
    () => ProfileRepoImp(CoreApiService(dio)),
  );
  getIt.registerFactory<ProfileCubit>(
    () => ProfileCubit(getIt<ProfileRepoImp>()),
  );
}
