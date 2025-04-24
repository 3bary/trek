import 'package:flutter/material.dart';
import 'package:greendo/features/profile/presentation/views/widgets/profile_view_body.dart';
import 'package:greendo/features/profile/presentation/views/widgets/profile_header.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  bool showCategories = false;

  void toggleView() {
    setState(() {
      showCategories = !showCategories;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.fromLTRB(13, 50, 13, 3),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProfileHeader(
                showCategories: showCategories,
                onTapTags: () {
                  if (showCategories) toggleView();
                },
                onTapCategories: () {
                  if (!showCategories) toggleView();
                },
              ),
              const SizedBox(height: 8),
              Expanded(child: ProfileViewBody(showCategories: showCategories)),
            ],
          ),
        ),
      ),
    );
  }
}
