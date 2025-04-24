import 'package:flutter/material.dart';
import 'package:greendo/core/utils/constants.dart';

class RecommendationView extends StatelessWidget {
  const RecommendationView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kPrimaryColor,
          title: Text(
            "Recommendation ",
            style: TextStyle(
              color: Colors.black38,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
