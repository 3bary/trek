import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

import 'package:greendo/core/utils/constants.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({
    super.key,
    this.onTap,
    required this.currentIndex,
  });

  final Function(int)? onTap;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: CurvedNavigationBar(
        index: currentIndex,
        color: kSecondaryColor,
        onTap: onTap,
        animationDuration: Duration(milliseconds: 250),
        backgroundColor: Colors.transparent,
        items: [
          Icon(
            Icons.search,
            size: 30,
            color: currentIndex == 0 ? Colors.white : Colors.white54,
          ),
          Icon(
            Icons.groups_2,
            size: 30,
            color: currentIndex == 1 ? Colors.white : Colors.white54,
          ),
          Icon(
            Icons.favorite,
            size: 30,
            color: currentIndex == 2 ? Colors.white : Colors.white54,
          ),
          Icon(
            Icons.person,
            size: 30,
            color: currentIndex == 3 ? Colors.white : Colors.white54,
          ),
        ],
      ),
    );
  }
}
