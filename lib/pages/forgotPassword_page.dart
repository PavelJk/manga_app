import 'package:flutter/material.dart';
import 'package:manga_app/components/forgotAndVerificationPhone.dart';
import 'package:manga_app/style/color_app.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorApp.backgroundApp,
      ),
      body: const ForgotPasswordAndVerificationPhoneBody(namePage: 'Forgot your password?'),
    );
  }
}