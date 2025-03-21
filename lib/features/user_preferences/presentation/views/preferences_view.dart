import 'package:flutter/material.dart';

import 'tags_view.dart';

class PreferencesView extends StatefulWidget {
  const PreferencesView({super.key});

  @override
  _PreferencesViewState createState() => _PreferencesViewState();
}

class _PreferencesViewState extends State<PreferencesView> {
  final PageController _pageController = PageController();
  List<String> selectedTags = [];
  List<String> selectedCategories = [];

  void _nextPage() {
    _pageController.nextPage(duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
  }

  void _previousPage() {
    _pageController.previousPage(duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
  }

  void _finishSelection() {
    // Send selected preferences to API
    print("Selected Tags: $selectedTags");
    print("Selected Categories: $selectedCategories");
    Navigator.pushReplacementNamed(context, '/home');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: NeverScrollableScrollPhysics(), // Disable swiping to force button navigation
        children: [
          TagsView(onNext: _nextPage),
        ],
      ),
    );
  }
}
