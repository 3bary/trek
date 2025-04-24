import 'package:flutter/material.dart';
import 'package:greendo/core/utils/constants.dart';
import 'custom_chip.dart';

class ProfileViewBody extends StatelessWidget {
  final bool showCategories;

  const ProfileViewBody({super.key, required this.showCategories});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Wrap(
          spacing: 8,
          runSpacing: 8,
          children:
              showCategories
                  ? AppConstants.categories.map((category) {
                    return CustomChip(
                      label: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(category.emoji, style: TextStyle(fontSize: 18)), // Emoji
                          SizedBox(width: 6),
                          Text(category.name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                        ],
                      ),
                    );
                  }).toList()
                  : AppConstants.tags.map((tag) {
                    return CustomChip(
                      label: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            tag.emoji,
                            style: TextStyle(fontSize: 18),
                          ), // Emoji
                          SizedBox(width: 6),
                          Text(
                            tag.name,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
        ),
      ),
    );
  }
}
