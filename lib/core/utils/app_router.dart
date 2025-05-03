import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:greendo/core/utils/service_locator.dart';
import 'package:greendo/features/home/data/repos/home/home_repo_imp.dart';
import 'package:greendo/features/home/presentation/views/home_view.dart';
import '../../features/auth/data/repos/auth_repo.dart';
import '../../features/auth/presentation/view_model/auth_bloc/auth_bloc.dart';
import '../../features/auth/presentation/views/login_view.dart';
import '../../features/auth/presentation/views/onboarding_view.dart';
import '../../features/auth/presentation/views/signup_view.dart';
import '../../features/home/presentation/view_model/reviews/place_reviews_cubit.dart';
import '../../features/recommendation/presentation/views/recommendation_view.dart';
import '../../features/home/presentation/view_model/home/home_cubit.dart';
import '../../features/home/presentation/views/place_details_view.dart';
import '../../features/favorites/presentation/views/favorite_view.dart';
import '../../features/home/presentation/views/group_view.dart';
import '../../features/profile/presentation/views/profile_view.dart';
import '../../features/recommendation/presentation/views/road_map_view.dart';
import '../../features/user_preferences/presentation/views/preferences_view.dart';
import '../models/place_model.dart';

abstract class AppRouter {
  static const String kLoginView = '/loginView';
  static const String kSignupView = '/signupView';
  static const String kHomeView = '/homeView';
  static const String kGroupView = '/groupView';
  static const String kFavoriteView = '/favoriteView';
  static const String kProfileView = '/profileView';
  static const String kPreferencesView = '/preferencesView';
  static const String kRecommendationView = '/recommendationView';
  static const String kPlaceDetailsView = '/placeDetailsView';
  static const String kRoadMapView = '/roadMapView';

  static final router = GoRouter(
    initialLocation: '/',
    routes: [
      // GoRoute(
      //   path: '/',
      //   builder:
      //       (context, state) => BlocProvider(
      //         create: (context) => AuthBloc(getIt<AuthRepo>()),
      //         child: const OnboardingView(),
      //       ),
      // ),
      // GoRoute(path: kLoginView, builder: (context, state) => const LoginView()),
      // GoRoute(
      //   path: kSignupView,
      //   builder: (context, state) => const SignupView(),
      // ),
      // ShellRoute groups onboarding + login + signup under same AuthBloc
      ShellRoute(
        builder: (context, state, child) {
          return BlocProvider(
            create: (context) => AuthBloc(getIt<AuthRepo>()),
            child: child,
          );
        },
        routes: [
          GoRoute(
            path: '/',
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
        builder: (context, state) => const PreferencesView(),
      ),
      GoRoute(
        path: kHomeView,
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
        path: kPlaceDetailsView,
        builder: (context, state) {
          final place = state.extra as PlaceModel;
          final placeId = place.id ?? '';
          return BlocProvider(
            create: (context) => PlaceReviewsCubit(getIt<HomeRepoImp>()..getPlaceReviews(placeId)),
            child: PlaceDetailsView(place: place),
          );
        },
      ),

      GoRoute(
        path: kRecommendationView,
        builder: (context, state) => const RecommendationView(),
      ),
      GoRoute(path: kRoadMapView, builder: (context, state) => RoadMapView()),
    ],
  );
}
