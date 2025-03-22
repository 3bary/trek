import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:greendo/core/utils/app_router.dart';
import 'package:greendo/core/utils/constants.dart';
import 'package:greendo/core/widgets/custom_button.dart';

class ActionsButtons extends StatelessWidget {
  const ActionsButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children:  [
        CustomButton(
          text: 'Log in',
          backgroundColor: kSecondaryColor,
          onPressed: () {
            GoRouter.of(context).push(AppRouter.kLoginView);
          }, textColor: kTextColor,
        ),
        const SizedBox(height: 16,),
        CustomButton(
          text: 'Sign up',
          backgroundColor: kTertiaryColor,
          onPressed: () {
            GoRouter.of(context).push(AppRouter.kSignupView);
          }, textColor: kTextColor,
        ),
      ],
    );
  }
}
