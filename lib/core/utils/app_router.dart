
import 'package:go_router/go_router.dart';
import 'package:greendo/features/auth/views/login_view.dart';
import 'package:greendo/features/auth/views/onboarding_view.dart';
import 'package:greendo/features/auth/views/signup_view.dart';
import 'package:greendo/features/home/views/home_view.dart';


abstract class AppRouter {

  static const String kLoginView = '/loginView';
  static const String kSignupView = '/signupView';
  static const String kHomeView = '/homeView';

  static final router = GoRouter(
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
      GoRoute(path: kHomeView,
          builder: (context, state) => const HomeView(),
      ),

    ],
  );
}
