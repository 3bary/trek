import 'package:flutter/material.dart';

import 'categories_view.dart';
import 'tags_view.dart';

class PreferencesView extends StatefulWidget {
  const PreferencesView({super.key});

  @override
  _PreferencesViewState createState() => _PreferencesViewState();
}

class _PreferencesViewState extends State<PreferencesView> {
  final PageController _pageController = PageController();

  void _nextPage() {
    _pageController.nextPage(duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
  }



  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: PageView(
          controller: _pageController,
          physics: NeverScrollableScrollPhysics(), // Disable swiping to force button navigation
          children: [
            TagsView(onNext: _nextPage),
            CategoriesView(),
          ],
        ),
      ),
    );
  }
}
