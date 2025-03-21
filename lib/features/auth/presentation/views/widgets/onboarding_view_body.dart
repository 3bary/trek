import 'package:flutter/material.dart';
import 'package:greendo/core/utils/constants.dart';

import 'actions_buttons.dart';
import 'circle_dot.dart';
import 'image_shape.dart';

class OnboardingViewBody extends StatelessWidget {
  const OnboardingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children:  [
          const SizedBox(height:16),
          Padding(
            padding: const EdgeInsets.only(left: 28.0),
            child: Row(
              children:  const [
                Text(
                  'GreenDo',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600,color: kTextColor),
                ),
                SizedBox(width:4),
                CircleDot(),
              ],
            ),
          ),
          const ImageShape(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28.0),
            child: Column(
              children: const[
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Let’s \nget started',
                    style: TextStyle(fontSize: 48, fontWeight: FontWeight.w600,color: kTextColor),
                  ),
                ),
                SizedBox(height: 24),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Your journey begins now',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400,color: kTextColor),
                  ),
                ),
                SizedBox(height: 48),
                ActionsButtons(),
                SizedBox(height: 24),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
