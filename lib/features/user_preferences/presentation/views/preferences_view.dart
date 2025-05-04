import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/utils/app_router.dart';
import '../../data/models/user_prefs_model.dart';
import '../view_model/user_prefs_cubit.dart';
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
      duration: const Duration(milliseconds: 500),
      curve: Curves.bounceInOut,
    );
  }

  void _submitPreferences() {
    selectedTags = selectedTags.map((tag) => tag.toLowerCase()).toList();
    selectedCategories =
        selectedCategories.map((category) => category.toLowerCase()).toList();
    // ✅ Log selected preferences
    print('✅ Selected Tags: $selectedTags');
    print('✅ Selected Categories: $selectedCategories');
    // ✅ Prepare model
    final userPreferences = UserPrefsModel(
      categories: selectedCategories,
      tags: selectedTags,
    );
      context.read<UserPrefsCubit>().updateUserPreferences(userPreferences);
  }


  @override
  Widget build(BuildContext context) {
    return BlocListener<UserPrefsCubit, UserPrefsState>(
      listener: (context, state) {
        if (state is UserPrefsFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.error),
            ),
          );
        }
        if (state is UserPrefsSuccess) {
          context.go(AppRouter.kHomeView);
        }
        if (state is UserPrefsLoading) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Loading...'),
            ),
              );
        }
      },
      child: SafeArea(
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
      ),
    );
  }
}
