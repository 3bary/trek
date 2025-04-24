import 'package:flutter/material.dart';

import '../../../../../core/utils/constants.dart';

class ProfileHeader extends StatelessWidget {
  final bool showCategories;
  final VoidCallback onTapTags;
  final VoidCallback onTapCategories;

  const ProfileHeader({
    super.key,
    required this.showCategories,
    required this.onTapTags,
    required this.onTapCategories,
  });

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
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 4,
                blurRadius: 10,
              ),
            ],
          ),
          child: Column(
            children: [
              const SizedBox(height: 100),
              const Text(
                "Welcome , Ahlam!",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Material(
                    color: Colors.transparent,
                    shape: const CircleBorder(),

                    child: InkWell(
                      onTap: onTapTags,
                      borderRadius: BorderRadius.circular(12),
                      splashColor: Colors.black12,
                      highlightColor: Colors.transparent,
                      child: Column(
                        children: const [
                          Icon(
                            Icons.tag_sharp,
                            size: 30,
                            color: kTertiaryColor,
                          ),
                          SizedBox(height: 5),
                          Text(
                            "Tags",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  Container(
                    width: 1,
                    height: 40,
                    color: Colors.black.withOpacity(0.3),
                  ),

                  Material(
                    color: Colors.transparent,
                    shape: const CircleBorder(),
                    child: InkWell(
                      onTap: onTapCategories,
                      borderRadius: BorderRadius.circular(12),
                      splashColor: Colors.black12,
                      highlightColor: Colors.transparent,
                      child: Column(
                        children: const [
                          Icon(
                            Icons.category_rounded,
                            size: 30,
                            color: kTertiaryColor,
                          ),
                          SizedBox(height: 5),
                          Text(
                            "Categories",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const Positioned(
          top: -45,
          left: 0,
          right: 0,
          child: CircleAvatar(
            radius: 74,
            child: CircleAvatar(
              radius: 74,
              backgroundImage: AssetImage("assets/images/profile.jpg"),
            ),
          ),
        ),
      ],
    );
  }
}
