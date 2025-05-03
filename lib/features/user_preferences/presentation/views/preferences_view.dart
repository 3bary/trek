import 'package:flutter/material.dart';
import 'categories_view.dart';
import 'tags_view.dart';

class PreferencesView extends StatefulWidget {
  const PreferencesView({super.key});

  @override
  _PreferencesViewState createState() => _PreferencesViewState();
}

class _PreferencesViewState extends State<PreferencesView> {
  late PageController _pageController;

  List<String> selectedTags = [];
  List<String> selectedCategories = [];

  @override
  void initState() {
    _pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void updateSelectedTags(List<String> tags) {
    setState(() {
      selectedTags = tags;
    });
  }

  void updateSelectedCategories(List<String> categories) {
    setState(() {
      selectedCategories = categories;
    });
  }

  void _nextPage() {
    _pageController.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void _submitPreferences() {
    print('✅ Selected Tags: $selectedTags');
    print('✅ Selected Categories: $selectedCategories');

    // Example POST request here:
    // apiService.post(endpoint: 'save_preferences', body: {
    //   'tags': selectedTags,
    //   'categories': selectedCategories,
    // });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: PageView(
          controller: _pageController,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            TagsView(
              onNext: _nextPage,
              selectedTags: selectedTags,
              onTagsChanged: updateSelectedTags,
            ),
            CategoriesView(
              selectedCategories: selectedCategories,
              onCategoriesChanged: updateSelectedCategories,
              onFinish: _submitPreferences,
            ),
          ],
        ),
      ),
    );
  }
}
