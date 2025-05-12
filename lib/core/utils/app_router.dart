import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:greendo/core/utils/service_locator.dart';
import 'package:greendo/features/home/data/repos/home/home_repo_imp.dart';

import 'package:greendo/features/home/presentation/views/home_view.dart';
import 'package:greendo/features/user_preferences/presentation/view_model/user_prefs_cubit.dart';

import '../../features/auth/data/repos/auth_repo.dart';
import '../../features/auth/presentation/view_model/auth_bloc/auth_bloc.dart';
import '../../features/auth/presentation/views/login_view.dart';
import '../../features/auth/presentation/views/onboarding_view.dart';
import '../../features/auth/presentation/views/signup_view.dart';
import '../../features/favorites/presentation/views/favorite_place_view.dart';
import '../../features/home/presentation/view_model/home/home_cubit.dart';

import '../../features/home/presentation/view_model/add_interactions/add_interactions_cubit.dart';
import '../../features/home/presentation/view_model/add_review_interactions/add_review_interactions_cubit.dart';

import '../../features/home/presentation/view_model/reviews/place_reviews_cubit.dart';
import '../../features/home/presentation/views/group_view.dart';
import '../../features/home/presentation/views/place_details_view.dart';
import '../../features/profile/presentation/views/profile_view.dart';
import '../../features/recommendation/presentation/views/recommendation_view.dart';
import '../../features/recommendation/presentation/views/road_map_view.dart';
import '../../features/splash/presentation/views/splash_view.dart';
import '../../features/user_preferences/data/repos/user_preferences_repo.dart';
import '../../features/user_preferences/presentation/views/preferences_view.dart';
import '../models/place_model.dart';

abstract class AppRouter {
  static const String kLoginView = '/loginView';
  static const String kSignupView = '/signupView';
  static const String kHomeView = '/homeView';
  static const String kGroupView = '/groupView';
  static const String kPlaceFavoriteView = '/placeFavoriteView';
  static const String kProfileView = '/profileView';
  static const String kPreferencesView = '/preferencesView';
  static const String kRecommendationView = '/recommendationView';
  static const String kPlaceDetailsView = '/placeDetailsView';
  static const String kRoadMapView = '/roadMapView';
  static const String kSettingsView='/settingsView';

  static const String kOnboardingView = '/onboardingView';
  static const String kSplashView = '/';
  static final router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: kSplashView,
        builder: (context, state) => const SplashView(),
      ),
      ShellRoute(
        builder: (context, state, child) {
          return BlocProvider(
            create: (context) => AuthBloc(getIt<AuthRepo>()),
            child: child,
          );
        },
        routes: [
          GoRoute(
            path: kOnboardingView,
            builder: (context, state) => const OnboardingView(),
          ),
          GoRoute(
            path: kLoginView,
            builder: (context, state) => const LoginView(),
          ),
          GoRoute(
            path: kSignupView,
            builder: (context, state) => const SignupView(),
          ),
        ],
      ),

      GoRoute(
        path: kPreferencesView,
        builder:
            (context, state) => BlocProvider(
              create: (context) => UserPrefsCubit(getIt<UserPreferencesRepo>()),
              child: const PreferencesView(),
            ),
      ),
      GoRoute(
        path: kHomeView,
        builder: (context, state) {
          return MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) {
                  final cubit = HomeCubit(getIt<HomeRepoImp>());
                  cubit.fetchAllPlaces();
                  return cubit;
                },
              ),
              BlocProvider(
                create: (context) => AddInteractionsCubit(getIt<HomeRepoImp>()),
              ),
            ],
            child: const HomeView(),
          );
        },
      ),
      GoRoute(
        path: kGroupView,
        builder: (context, state) => const GroupsView(),
      ),
      GoRoute(
        path: kPlaceFavoriteView,
        builder: (context, state) {
          return const FavoritePlaceView();
        },
      ),

      GoRoute(
        path: kProfileView,
        builder: (context, state) => const ProfileView(),
      ),
      GoRoute(
        path: kPlaceDetailsView,
        builder: (context, state) {
          final place = state.extra as PlaceModel;
          return MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) {
                  final cubit = PlaceReviewsCubit(getIt<HomeRepoImp>());
                  cubit.getPlaceReviews(place.id ?? '');
                  return cubit;
                },
              ),

              BlocProvider(
                create: (context) => AddInteractionsCubit(getIt<HomeRepoImp>()),
              ),
              BlocProvider(
                create:
                    (context) =>
                        AddReviewInteractionsCubit(getIt<HomeRepoImp>()),
              ),
            ],
            child: PlaceDetailsView(place: place),
          );
        },
      ),
      GoRoute(
        path: kRecommendationView,
        builder: (context, state) => const RecommendationView(),
      ),
      GoRoute(
        path: kRoadMapView,
        builder: (context, state) => RoadMapView(),
      ),

    ],
  );
}
