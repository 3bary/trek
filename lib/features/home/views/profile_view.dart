import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: const Center(
          child: Text("Profile Screen ", style: TextStyle(fontSize: 24)),
        ),
      ),
    );
  }
}
