import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:greendo/core/utils/constants.dart';
import 'package:greendo/core/widgets/custom_button.dart';
import 'package:greendo/core/widgets/custom_text_form_field.dart';
import '../../../../../core/utils/app_router.dart';
import '../../../data/models/register_request_body.dart';
import '../../view_model/auth_bloc/auth_bloc.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({super.key});

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  GlobalKey<FormState> formKey = GlobalKey();
  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  bool isLoading = false;
  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthLoading) {
          // implement loading dialog
          setState(() {
            isLoading = true;
          }
          );
        } else if (state is RegisterSuccess) {
          setState(() {
            isLoading = false;
          }
          );
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Register Success'),
            ),
          );

          GoRouter.of(context).go(AppRouter.kPreferencesView);
        } else if (state is AuthFailure) {
          setState(() {
            isLoading = false;
          }
          ); // close loading
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
            ),
          );
        }
      },
      child: Form(
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
              hintText: 'Full Name',
              obscureText: false,
              textInputType: TextInputType.name,
              textEditingController: nameController,
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
              textInputType: TextInputType.emailAddress,
              textEditingController: emailController,
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
              obscureText: !isPasswordVisible,
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    isPasswordVisible = !isPasswordVisible;
                  });
                },
                icon: const Icon(
                  Icons.remove_red_eye_outlined,
                  color: Color(0xff96A7AF),
                ),
              ),
              textInputType: TextInputType.text,
              textEditingController: passwordController,
            ),
            const SizedBox(height: 24),
            CustomTextFormField(
              validator: (data) {
                if (data != passwordController.text) {
                  return 'not correct';
                }
                return null;
              },
              icon: Icons.lock_outlined,
              hintText: 'Confirm password',
              obscureText: !isConfirmPasswordVisible,
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    isConfirmPasswordVisible = !isConfirmPasswordVisible;
                  });
                },
                icon: const Icon(
                  Icons.remove_red_eye_outlined,
                  color: Color(0xff96A7AF),
                ),
              ),
              textInputType: TextInputType.text,
              textEditingController: confirmPasswordController,
            ),
            const SizedBox(height: 24),
            isLoading ? const CircularProgressIndicator() : CustomButton(
              text: 'Sign up',
              backgroundColor: kSecondaryColor,
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  RegisterRequestBody registerRequestBody = RegisterRequestBody(
                    name: nameController.text,
                    email: emailController.text,
                    password: passwordController.text,
                  );
                  context.read<AuthBloc>().add(
                    RegisterEvent(
                     registerRequestBody,
                    ),
                  );
                }
              },
              textColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
