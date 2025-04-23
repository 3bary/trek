import 'package:flutter/material.dart';
import '../../../../../core/utils/constants.dart';

class CategoryNamesList extends StatelessWidget {
  const CategoryNamesList({super.key});

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
          return Chip(
            label: Text(
              categoryName,
              style: const TextStyle(color: Colors.black),
            ),
            backgroundColor: Colors.white,
            side: const BorderSide(color: Colors.white),
          );
        },
      ),
    );
  }
}
