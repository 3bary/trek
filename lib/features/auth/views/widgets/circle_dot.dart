import 'package:flutter/material.dart';
import 'package:greendo/core/utils/constants.dart';

class CircleDot extends StatelessWidget {
  const CircleDot({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      width:10,
      height:10,
      decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: kSecondaryColor
      ),
    );
  }
}
