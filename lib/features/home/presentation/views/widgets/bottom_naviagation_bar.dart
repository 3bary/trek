import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../view_model/navigation_cubit/navigation_cubit.dart';

class CustomBottomNavigation extends StatelessWidget {
  const CustomBottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      color: Color(0xffA8E6CF),
      onTap: (index) {
        context.read<NavigationCubit>().changePage(index);
      },
      animationDuration: Duration(milliseconds: 250),
      backgroundColor: Colors.transparent,
      items: [
        Icon(Icons.search, size: 35,color: Colors.black38),
        Icon(Icons.groups_2, size: 35,color: Colors.black38),
        Icon(Icons.favorite, size: 35,color: Colors.black38),
        Icon(Icons.person, size: 35,color: Colors.black38),
      ],
    );
  }
}
