import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:greendo/features/home/views/discover_screen_body.dart';
import 'package:greendo/features/home/views/profile_screen.dart';

import 'cubit/navigation_cubit.dart';
import 'favorite_screen.dart';
import 'group_screen.dart';
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
            DiscoverScreenBody(),
            GroupsScreen(),
            FavoriteScreen(),
            ProfileScreen(),
          ];
          return Scaffold(
            appBar: AppBar(
              toolbarHeight: 80,
              backgroundColor: Color(0xffA8E6CF),
              automaticallyImplyLeading: false,
              elevation: 0,
              title: Text(
                appBarTitles[currentIndex],
                textAlign: TextAlign.start,
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.black38),
              ),
            ),
            body: IndexedStack(
                index: currentIndex,
                children:pages
            ),
            bottomNavigationBar: CustomBottomNavigation(),
            floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
            floatingActionButton: Transform.translate(
              offset: Offset(0, -35),
              child: FloatingActionButton(
                onPressed: () {},
                backgroundColor: Color(0xffA8E6CF),
                shape: CircleBorder(),
                child: Icon(Icons.mode_edit, color: Colors.white, size: 30),
              ),
            ),
          );
        },
      ),
    );
  }
}
