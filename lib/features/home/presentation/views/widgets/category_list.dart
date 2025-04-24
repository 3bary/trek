
import 'package:flutter/material.dart';

import '../../../../../core/utils/constants.dart';

class CategoryNamesList extends StatelessWidget {
  final Function(String categoryName) onCategorySelected;

  const CategoryNamesList({
    super.key,
    required this.onCategorySelected,
  });

  @override
  Widget build(BuildContext context) {
    final categories = AppConstants.categories;

    return SizedBox(
      height: 60,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        itemCount: categories.length,
        separatorBuilder: (_, __) => const SizedBox(width: 10),
        itemBuilder: (context, index) {
          final categoryName = categories[index].name;
          return GestureDetector(
            onTap: () => onCategorySelected(categoryName),
            child: Chip(
              label: Text(
                categoryName,
                style: const TextStyle(color: Colors.black),
              ),
              backgroundColor: Colors.white,
              side: const BorderSide(color: Colors.white),
            ),
          );
        },
      ),
    );
  }
}
