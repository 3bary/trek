import 'package:flutter/material.dart';

class RecommendationView extends StatelessWidget {
  const RecommendationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 80,
        backgroundColor: Color(0xffA8E6CF),
        title: Text(
          "Recommendation ",
          style: TextStyle(color: Colors.black38, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
