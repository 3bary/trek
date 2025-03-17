
import 'package:flutter/material.dart';
import 'package:greendo/features/home/views/widgets/custom_discover_view.dart';

import 'widgets/bottom_naviagation_bar.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: Color(0xffA8E6CF),
        automaticallyImplyLeading: false,
        elevation: 0,
        title: const Text(
          '  Discover',
          textAlign: TextAlign.start,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: CustomDiscoverView(),
      bottomNavigationBar: CustomBottomNavigation(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: Transform.translate(
        offset: Offset(0,-30),
        child: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Color(0xffA8E6CF),
          shape: CircleBorder(),
          child: Icon(Icons.mode_edit, color: Colors.white, size: 30),
        ),
      ),
    );
  }
}
