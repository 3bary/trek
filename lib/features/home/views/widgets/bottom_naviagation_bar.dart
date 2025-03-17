import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class CustomBottomNavigation extends StatelessWidget {
  const CustomBottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      // buttonBackgroundColor: Color(0xffF5E6CA),
      color: Color(0xffA8E6CF),
      onTap: (index) {
        print(index + 1);
      },
      animationDuration: Duration(milliseconds: 250),
      backgroundColor:Colors.transparent,
      items: [
        Icon(Icons.search, size: 35),
        Icon(Icons.groups_2, size: 35),
        Icon(Icons.favorite, size: 35),
        Icon(Icons.person, size: 35),
      ],
    );
  }
}
