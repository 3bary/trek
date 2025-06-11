import 'package:flutter/material.dart';
import 'package:greendo/core/models/user_model.dart';
import 'package:greendo/features/profile/presentation/views/widgets/settings_menu.dart';

import '../../../../../core/utils/constants.dart';

class ProfileHeader extends StatefulWidget {
  final bool showCategories;
  final VoidCallback onTapTags;
  final VoidCallback onTapCategories;
  final UserModel user;

  const ProfileHeader({
    super.key,
    required this.showCategories,
    required this.onTapTags,
    required this.onTapCategories,
    required this.user,
  });

  @override
  State<ProfileHeader> createState() => _ProfileHeaderState();
}

class _ProfileHeaderState extends State<ProfileHeader> {
  String selected = "Tags";

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: kSecondaryColor,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.7),
                spreadRadius: 4,
                blurRadius: 10,
              ),
            ],
          ),
          child: Column(
            children: [
              const SizedBox(height: 100),
              Text(
                widget.user.name ?? "No Name Available",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildIconButton(
                    icon: Icons.tag_sharp,
                    label: "Tags",
                    isSelected: selected == "Tags",
                    onTap: () {
                      widget.onTapTags();
                      setState(() => selected = "Tags");
                    },
                  ),
                  Container(
                    width: 1,
                    height: 40,
                    color: const Color.fromRGBO(255, 255, 255, 0.3),
                  ),
                  _buildIconButton(
                    icon: Icons.category_rounded,
                    label: "Categories",
                    isSelected: selected == "Categories",
                    onTap: () {
                      widget.onTapCategories();
                      setState(() => selected = "Categories");
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
        Positioned(
          top: -45,
          left: 0,
          right: 0,
          child: CircleAvatar(
            radius: 74,
            backgroundColor: Colors.white,
            child: ClipOval(
              child: Image.asset(
                'assets/images/profile.jpg',
                fit: BoxFit.cover,
                width: 140,
                height: 140,
              ),
            ),
          ),
        ),

        Positioned(
          top: 50,
          left: 105,
          child: CircleAvatar(
            radius: 20,
            backgroundColor: Colors.white,
            child: IconButton(
              icon: const Icon(Icons.settings, color: Colors.black, size: 18),
              onPressed:
                  () => SettingsMenu.show(context, parentContext: context),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildIconButton({
    required IconData icon,
    required String label,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return Material(
      color: Colors.transparent,
      shape: const CircleBorder(),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        splashColor: Colors.black12,
        highlightColor: Colors.transparent,
        child: Column(
          children: [
            Icon(
              icon,
              size: 30,
              color: isSelected ? Colors.white : Colors.white54,
            ),
            const SizedBox(height: 5),
            Text(
              label,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: isSelected ? Colors.white : Colors.white54,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
