import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'core/utils/app_router.dart';
import 'core/utils/constants.dart';
import 'core/utils/service_locator.dart';
import 'core/utils/simple_bloc_observer.dart';

void main() {
  Bloc.observer = SimpleBlocObserver();
  setupServiceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.router,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.soraTextTheme(),
        scaffoldBackgroundColor: kPrimaryColor,
      ),
    );
  }
}
