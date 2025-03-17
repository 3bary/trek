import 'package:flutter/material.dart';
import 'package:greendo/core/widgets/custom_appBar.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: Text("Favorite Screen ", style: TextStyle(fontSize: 24)),
      ),
    );
  }
}
