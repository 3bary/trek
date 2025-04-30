import 'package:flutter/material.dart';

import '../../../../../core/utils/constants.dart';

class ProfileHeader extends StatefulWidget {
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
                color: Colors.grey.withValues(blue: 0.5),
                spreadRadius: 4,
                blurRadius: 10,
              ),
            ],
          ),
          child: Column(
            children: [
              const SizedBox(height: 100),
              const Text(
                "Ahlam gomaa",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white54,
                ),
              ),
              const SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Material(
                    color: Colors.transparent,
                    shape: const CircleBorder(),
                    child: InkWell(
                      onTap: () {
                        widget.onTapTags();
                        setState(() {
                          selected = "Tags";
                        });
                      },
                      borderRadius: BorderRadius.circular(12),
                      splashColor: Colors.black12,
                      highlightColor: Colors.transparent,
                      child: Column(
                        children: [
                          Icon(
                            Icons.tag_sharp,
                            size: 30,
                            color:
                                selected == "Tags"
                                    ? Colors.white
                                    : Colors.white54,
                          ),
                          const SizedBox(height: 5),
                          Text(
                            "Tags",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color:
                                  selected == "Tags"
                                      ? Colors.white
                                      : Colors.white54,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: 1,
                    height: 40,
                    color: const Color.fromRGBO(255, 255, 255, 0.5),
                  ),
                  Material(
                    color: Colors.transparent,
                    shape: const CircleBorder(),
                    child: InkWell(
                      onTap: () {
                        widget.onTapCategories();
                        setState(() {
                          selected = "Categories";
                        });
                      },
                      borderRadius: BorderRadius.circular(12),
                      splashColor: Colors.black12,
                      highlightColor: Colors.transparent,
                      child: Column(
                        children: [
                          Icon(
                            Icons.category_rounded,
                            size: 30,
                            color:
                                selected == "Categories"
                                    ? Colors.white
                                    : Colors.white54,
                          ),
                          const SizedBox(height: 5),
                          Text(
                            "Categories",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color:
                                  selected == "Categories"
                                      ? Colors.white
                                      : Colors.white54,
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

        Positioned(
          top: 50,
          left: 105,
          child: CircleAvatar(
            radius: 20,
            backgroundColor: Colors.white54,
            child: IconButton(
              icon: const Icon(Icons.settings, color: Colors.black, size: 18),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            ),
          ),
        ),
      ],
    );
  }
}
