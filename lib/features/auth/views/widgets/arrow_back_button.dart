import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:greendo/core/utils/constants.dart';

class ArrowBackButton extends StatelessWidget {
  const ArrowBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(FontAwesomeIcons.arrowLeft, size: 32),
      color: kTextColor,
      onPressed: () {
        GoRouter.of(context).pop();
      },
    );
  }
}
