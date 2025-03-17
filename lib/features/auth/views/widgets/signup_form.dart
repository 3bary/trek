import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:greendo/core/utils/constants.dart';
import 'package:greendo/core/widgets/custom_button.dart';
import 'package:greendo/core/widgets/custom_text_form_field.dart';

import '../../../../core/utils/app_router.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({super.key});

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  GlobalKey<FormState> formKey = GlobalKey();
  bool obscurePassword1 = true;
  bool obscurePassword2 = true;
  String? password;
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
              hintText: 'Username',
              obscureText: false,
            ),
            const SizedBox(height: 24),
            CustomTextFormField(
              validator: (data) {
                if (!(data!.contains('@'))) {
                  return 'email is not true';
                }
                return null;
              },
              icon: FontAwesomeIcons.envelopeOpen,
              hintText: 'Email address',
              obscureText: false,
            ),
            const SizedBox(height: 24),
            CustomTextFormField(
              validator: (data){
                if (data!.isEmpty) {
                  return 'field is required';
                }
                return null;
              },
              onChanged: (data){
                password = data;
              },
              icon: Icons.lock_outlined,
              hintText: 'Password',
              obscureText: obscurePassword1,
              suffixIcon: IconButton(
                onPressed:(){
                  setState(() {
                    obscurePassword1 = !obscurePassword1;
                  });
                },
                icon: const Icon(
                  Icons.remove_red_eye_outlined,
                  color: Color(0xff96A7AF),
                ),
              ),
            ),
            const SizedBox(height: 24),
             CustomTextFormField(
              validator: (data){
                if(data != password){
                  return 'not correct';
              }
                return null;
                },
              icon: Icons.lock_outlined,
              hintText: 'Confirm password',
               obscureText: obscurePassword2,
               suffixIcon: IconButton(
                 onPressed:(){
                   setState(() {
                     obscurePassword2 = !obscurePassword2;
                   });
                 },
                 icon: const Icon(
                   Icons.remove_red_eye_outlined,
                   color: Color(0xff96A7AF),
                 ),
               ),
            ),
            const SizedBox(height: 24),
            CustomButton(
              text: 'Sign up',
              backgroundColor: kSecondaryColor,
              onPressed: (){
                GoRouter.of(context).pushReplacement(AppRouter.kDiscoverView);
                formKey.currentState!.validate();
              }, textColor: kTextColor,
            ),
          ],
        ));
  }
}
