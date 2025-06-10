import 'package:flutter/material.dart';

import '../../../../core/utils/constants.dart';
import 'widgets/categories_view_body.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({
    super.key,
    required this.selectedCategories,
    required this.onCategoriesChanged,
    required this.onFinish,
  });

  final List<String> selectedCategories;
  final Function(List<String>) onCategoriesChanged;
  final Function() onFinish;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Select Categories"),
        automaticallyImplyLeading: false,
        backgroundColor: kPrimaryColor,
      ),
      body: CategoriesViewBody(
        selectedCategories: selectedCategories,
        onCategoriesChanged: onCategoriesChanged,
        onFinish: onFinish,
      ),
    );
  }
}
