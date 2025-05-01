import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../../../core/utils/constants.dart';

class SettingsMenu {
  static void show(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => _SettingsDialog(),
    );
  }
}

class _SettingsDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: kPrimaryColor,
      title: const Text(
        textAlign: TextAlign.center,
        'Settings',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: const Icon(Icons.image),
            title: const Text('Edit Image'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.room_preferences),
            title: const Text('Edit Preferences'),
            onTap: () {
              Navigator.pop(context);
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
              Navigator.pop(context);
              GoRouter.of(context).go('/');
            },
          ),
        ],
      ),
      actions: [
        TextButton(
          child: const Text(
            'Close',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: kTextColor,
            ),
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ],
    );
  }
}