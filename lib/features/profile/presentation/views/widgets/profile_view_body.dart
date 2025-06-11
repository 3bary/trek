import 'package:flutter/material.dart';
import 'package:greendo/core/models/user_model.dart';

import '../../../../../core/widgets/custom_chip.dart';

class ProfileViewBody extends StatelessWidget {
  final bool showCategories;
  final UserModel user;

  const ProfileViewBody({
    super.key,
    required this.showCategories,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Wrap(
          spacing: 8,
          runSpacing: 8,
          children:
              showCategories
                  ? (user.preferences?.categories ?? []).map((category) {
                    return CustomChip(
                      label: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            category,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList()
                  : (user.preferences?.tags ?? []).map((tag) {
                    return CustomChip(
                      label: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            tag,
                            style: const TextStyle(
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
