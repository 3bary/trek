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
                      label: Text(
                        category.name,
                        style: const TextStyle(color: Colors.black),
                      ),
                    );
                  }).toList()
                  : AppConstants.tags.map((tag) {
                    return CustomChip(
                      label: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            tag.description.split(" ").first,
                            style: const TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(width: 5),
                          Text(
                            tag.name,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.black,
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
