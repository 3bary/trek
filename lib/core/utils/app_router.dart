import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:greendo/core/utils/service_locator.dart';
import 'package:greendo/features/home/data/repos/home/home_repo_imp.dart';
import '../../features/auth/presentation/views/login_view.dart';
import '../../features/auth/presentation/views/onboarding_view.dart';
import '../../features/auth/presentation/views/signup_view.dart';
import '../../features/recommendation/presentation/views/recommendation_view.dart';
import '../../features/home/presentation/view_model/home/home_cubit.dart';
import '../../features/home/presentation/views/detail_view.dart';
import '../../features/favorites/presentation/views/favorite_view.dart';
import '../../features/home/presentation/views/group_view.dart';
import '../../features/home/presentation/views/home_view.dart';
import '../../features/profile/presentation/views/profile_view.dart';
import '../../features/recommendation/presentation/views/road_map_view.dart';
import '../../features/user_preferences/presentation/views/preferences_view.dart';
import '../models/place_model.dart';


abstract class AppRouter {
  static const String kLoginView = '/loginView';
  static const String kSignupView = '/signupView';
  static const String kDiscoverView = '/discoverView';
  static const String kGroupView = '/groupView';
  static const String kFavoriteView = '/favoriteView';
  static const String kProfileView = '/profileView';
  static const String kPreferencesView = '/preferencesView';
  static const String kRecommendationView = '/recommendationView';
  static const String kDetailView = '/detailView';
  static const String kRoadMapView = '/roadMapView';
  static const String kSettingsView='/settingsView';

  static final router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(path: '/', builder: (context, state) => const OnboardingView()),
      GoRoute(path: kLoginView, builder: (context, state) => const LoginView()),
      GoRoute(
        path: kSignupView,
        builder: (context, state) => const SignupView(),
      ),
      GoRoute(
        path: kPreferencesView,
        builder: (context, state) => const PreferencesView(),
      ),
      GoRoute(
        path: kDiscoverView,
        builder: (context, state) {
          return BlocProvider(
            create:
                (context) => HomeCubit(getIt<HomeRepoImp>()..getAllPlaces()),
            child: const HomeView(),
          );
        },
      ),
      GoRoute(
        path: kGroupView,
        builder: (context, state) => const GroupsView(),
      ),
      GoRoute(path: kFavoriteView, builder: (context, state) => FavoriteView()),
      GoRoute(
        path: kProfileView,
        builder: (context, state) => const ProfileView(),
      ),
      GoRoute(
        path: kDetailView,
        builder: (context, state) {
          final place = state.extra as PlaceModel;
          return DetailView(place: place);
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
