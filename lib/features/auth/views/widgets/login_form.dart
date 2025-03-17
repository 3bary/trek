import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:greendo/core/utils/constants.dart';
import 'package:greendo/core/widgets/custom_button.dart';
import 'package:greendo/core/widgets/custom_text_form_field.dart';

import '../../../../core/utils/app_router.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  GlobalKey<FormState> formKey = GlobalKey();
  bool obscurePassword = true;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          CustomTextFormField(
            validator: (data) {
              if (data!.isEmpty) {
                return 'field is required';
              }
              return null;
            },
            icon: FontAwesomeIcons.user,
            hintText: 'Email or username',
            obscureText: false,
          ),
          const SizedBox(height: 24),
          CustomTextFormField(
            validator: (data) {
              if (data!.isEmpty) {
                return 'field is required';
              }
              return null;
            },
            icon: Icons.lock_outlined,
            hintText: 'Password',
            obscureText: obscurePassword,
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  obscurePassword = !obscurePassword;
                });
              },
              icon: const Icon(
                Icons.remove_red_eye_outlined,
                color: Color(0xff96A7AF),
              ),
            ),
          ),
          const SizedBox(height: 16),
          const Align(
            alignment: Alignment.centerRight,
            child: Text(
              'Forgot password?',
              style: TextStyle(
                color: kPrimaryColor,
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          const SizedBox(height: 24),
          CustomButton(
            text: 'Log in',
            backgroundColor: kSecondaryColor,
            onPressed: () {
             GoRouter.of(context).pushReplacement(AppRouter.kHomeView) ;
            },
            textColor: kTextColor,
          ),
        ],
      ),
    );
  }
}
