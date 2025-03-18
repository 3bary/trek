import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:greendo/core/utils/app_router.dart';
import 'package:greendo/core/utils/constants.dart';
import 'package:greendo/features/auth/views/widgets/arrow_back_button.dart';
import 'package:greendo/features/auth/views/widgets/login_form.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 28.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            const ArrowBackButton(),
            const SizedBox(height: 36),
            const Text(
              'Welcome back',
              style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w600,
                  color: kTextColor),
            ),
            const SizedBox(height: 16),
            const Text(
              'Enter your credential to continue',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff879EA4)),
            ),
            const SizedBox(height: 36),
            const LoginForm(),
            const SizedBox(height: 36),
            Center(
                child: GestureDetector(
                  onTap: (){
                    GoRouter.of(context).pushReplacement(AppRouter.kSignupView);
                  },
                  child: RichText(
                                text: const TextSpan(
                  style: TextStyle(fontSize: 14, color: kTextColor),
                  children: [
                    TextSpan(
                      text: 'Don’t have account? ',
                    ),
                    TextSpan(
                      text: 'Sign up',
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                        decorationColor: kSecondaryColor,
                      ),
                    ),
                  ],
                                ),
                              ),
                ),
            ),
            const SizedBox(
              height: 24,
            )
          ],
        ),
      ),
    );
  }
}
