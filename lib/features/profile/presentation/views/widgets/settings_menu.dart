

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../../../core/utils/constants.dart';
import '../../../../../core/helpers/cash_helper.dart';
import '../../view_model/profile/profile_cubit.dart';

class SettingsMenu {
  static void show(
    BuildContext context, {
    required BuildContext parentContext,
  }) {
    showDialog(
      context: context,
      builder: (_) => _SettingsDialog(parentContext: parentContext),
    );
  }
}

class _SettingsDialog extends StatelessWidget {
  final BuildContext parentContext;

  const _SettingsDialog({required this.parentContext});

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
            leading: const Icon(Icons.room_preferences),
            title: const Text('Edit Preferences'),
            onTap: () async {
              Navigator.pop(context);
              await GoRouter.of(context).push('/preferencesView');
              await parentContext.read<ProfileCubit>().getUserById();
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout_rounded, color: Colors.red),
            title: const Text(
              'Logout',
              style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
            ),
            onTap: () async {
              await CashHelper.clearCachedUser();
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
