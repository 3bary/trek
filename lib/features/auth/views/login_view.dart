import 'package:flutter/material.dart';
import 'widgets/login_view_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: LoginViewBody(),
      ),
    );
  }
}
