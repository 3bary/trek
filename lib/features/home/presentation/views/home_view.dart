import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:greendo/features/home/presentation/views/favorite_view.dart';

import '../../../../core/utils/app_router.dart';

import '../../../profile/presentation/views/profile_view.dart';
import '../view_model/navigation_cubit/navigation_cubit.dart';
import 'discover_view.dart';

import 'group_view.dart';
import 'widgets/bottom_naviagation_bar.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => NavigationCubit(),
      child: BlocBuilder<NavigationCubit, int>(
        builder: (context, currentIndex) {
          List<String> appBarTitles = [
            "Discover",
            "Groups",
            "Favorites",
            "Profile",
          ];
          List<Widget> pages = [
            DiscoverView(),
            GroupsView(),
            FavoriteView(),
            ProfileView(),
          ];
          return SafeArea(
            child: Scaffold(
              appBar: AppBar(
                toolbarHeight: 80,
                backgroundColor: Color(0xffA8E6CF),
                automaticallyImplyLeading: false,
                elevation: 10,
                title: Text(
                  appBarTitles[currentIndex],
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black38,
                  ),
                ),
              ),
              body: Padding(
                padding: EdgeInsets.only(top: 3),
                child: IndexedStack(index: currentIndex, children: pages),
              ),
              bottomNavigationBar: CustomBottomNavigation(),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.endFloat,
              floatingActionButton: Tooltip(
                message: " recommendation!",
                preferBelow: false,
                verticalOffset: 50,
                child: Transform.translate(
                  offset: Offset(0, -30),
                  child: FloatingActionButton(
                    onPressed: () {
                      GoRouter.of(context).push(AppRouter.kRecommendationView);
                    },
                    backgroundColor: Color(0xffA8E6CF),
                    // shape: CircleBorder(),
                    child: Icon(
                      Icons.mode_edit,
                      color: Colors.black38,
                      size: 30,
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
