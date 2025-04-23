import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:greendo/features/home/presentation/views/profile_view.dart';
import 'package:greendo/features/home/presentation/views/widgets/bottom_naviagation_bar.dart';

import '../../../../core/utils/app_router.dart';
import '../../../../core/utils/constants.dart';
import 'discover_view.dart';
import 'favorite_view.dart';
import 'group_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int currentIndex = 0;

  final List<Widget> pages = [
    DiscoverView(),
    GroupsView(),
    FavoriteView(),
    ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: pages[currentIndex],
        bottomNavigationBar: CustomBottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: Tooltip(
          message: "recommendation!",
          preferBelow: false,
          verticalOffset: 70,
          child: Transform.translate(
            offset: const Offset(0, -30),
            child: FloatingActionButton(
              onPressed: () {
                GoRouter.of(context).push(AppRouter.kRecommendationView);
              },
              backgroundColor: kSecondaryColor,
              child: const Icon(
                Icons.mode_edit,
                color: Colors.black38,
                size: 30,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
