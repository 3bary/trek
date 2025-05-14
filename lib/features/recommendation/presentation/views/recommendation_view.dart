import 'package:flutter/material.dart';
import 'package:greendo/core/utils/constants.dart';

import 'widgets/recommendation_view_body.dart';

class RecommendationView extends StatelessWidget {
  const RecommendationView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Travel Preferences"),
          backgroundColor: kPrimaryColor,
        ),
        body: RecommendationViewBody(),
      ),
    );
  }
}
