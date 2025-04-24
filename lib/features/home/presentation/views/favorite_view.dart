import 'package:flutter/material.dart';


class FavoriteView extends StatelessWidget {
  const FavoriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Text("Favorite view ", style: TextStyle(fontSize: 24)),
        ),
      ),
    );
  }
}
