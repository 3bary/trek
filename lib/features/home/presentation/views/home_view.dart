import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/utils/app_router.dart';
import '../../../favorites/presentation/views/favorite_view.dart';
import '../../../profile/presentation/views/profile_view.dart';
import 'package:greendo/features/home/presentation/views/widgets/bottom_naviagation_bar.dart';
import 'discover_view.dart';
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
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(bottom: 30),
          child: Tooltip(
            message: "recommendation!",
            preferBelow: false,
            verticalOffset: 70,
            child: FloatingActionButton(
              onPressed: () {
                context.push(AppRouter.kRecommendationView);
              },
              backgroundColor: Colors.blueGrey,
              child: const Icon(
                Icons.mode_edit,
                color: Colors.white,
                size: 30,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
