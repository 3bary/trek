import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:greendo/core/utils/constants.dart';
import 'package:greendo/core/widgets/custom_button.dart';
import 'package:greendo/core/widgets/custom_text_form_field.dart';
import '../../../../../core/utils/app_router.dart';
import '../../../data/models/login_request_body.dart';
import '../../view_model/auth_bloc/auth_bloc.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  GlobalKey<FormState> formKey = GlobalKey();
  bool isPasswordVisible = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isLoading = false;
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthLoading) {
         setState(() {
           isLoading = true;
         }
         );
        } else if (state is LoginSuccess) {
          setState(() {
            isLoading = false;// close loading
          }
          );
          final token = state.token;
          // implement cashing

          context.go(AppRouter.kHomeView);
        } else if (state is AuthFailure) {
          setState(() {
            isLoading = false;// close loading
          }
          );
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
            ),
          );
        }      },
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
            const SizedBox(height: 16),
            const Align(
              alignment: Alignment.centerRight,
              child: Text(
                'Forgot password?',
                style: TextStyle(
                  color: kTextColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            const SizedBox(height: 24),
            isLoading ? const CircularProgressIndicator() : CustomButton(
              text: 'Log in',
              backgroundColor: kSecondaryColor,
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  context.read<AuthBloc>().add(
                    LoginEvent(
                      LoginRequestBody(
                        email: emailController.text,
                        password: passwordController.text,
                      ),
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
