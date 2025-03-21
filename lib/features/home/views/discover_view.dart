import 'package:flutter/material.dart';

import '../../../core/utils/constants.dart';

class DiscoverView extends StatelessWidget{
  const DiscoverView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return  Container(
            padding: EdgeInsets.all(10),
        height: 150,
        width: double.infinity,
        margin: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
        decoration: BoxDecoration(
        color: kTertiaryColor,
        borderRadius: BorderRadius.circular(10),
        )
        );
      }

    );
  }
}