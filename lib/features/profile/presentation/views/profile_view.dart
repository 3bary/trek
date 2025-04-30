import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:greendo/features/profile/presentation/views/widgets/profile_header.dart';
import 'package:greendo/features/profile/presentation/views/widgets/profile_view_body.dart';

import '../../../../core/utils/constants.dart';

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
        drawer: Drawer(
          child: ListView(
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(color: kSecondaryColor),
                child: Text(
                  textAlign: TextAlign.center,
                  'Settings',
                  style: TextStyle(color: Colors.white54, fontSize: 24),
                ),
              ),
              const ListTile(
                leading: Icon(Icons.image),
                title: Text('Edit Image '),
              ),

              ListTile(
                leading: const Icon(Icons.room_preferences),
                title: const Text('Edit Preferences '),
                onTap: () {
                  GoRouter.of(context).go('/preferencesView');
                },
              ),
              ListTile(
                leading: const Icon(Icons.logout, color: Colors.red),
                title: const Text(
                  'Logout',
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onTap: () {
                  GoRouter.of(context).go('/');
                },
              ),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(13, 65, 13, 3),
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
