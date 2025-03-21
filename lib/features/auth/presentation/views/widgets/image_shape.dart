import 'package:flutter/material.dart';
import 'package:greendo/core/utils/assets.dart';
import 'package:greendo/core/utils/constants.dart';

class ImageShape extends StatelessWidget {
  const ImageShape({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height:320,
      child: Stack(
        children: [
          Positioned(
            left: 120,
            top: 10,
            child: Container(
              width: 300,
              height:300,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: kTertiaryColor
              ),
            ),
          ),
           const Positioned(
              top: 0,
              left: 50,
              child: Image(
                width: 350,
                image: AssetImage(kPlaneImage),
              )
          ),
        ],
      ),
    );
  }
}
