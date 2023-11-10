// ignore_for_file: unnecessary_null_comparison
import 'package:flutter/material.dart';
import 'package:manga_app/components/forgotAndVerificationPhone.dart';
import 'package:manga_app/style/color_app.dart';

class VerificationPhonePage extends StatelessWidget {
  const VerificationPhonePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorApp.backgroundApp,
      ),
      body: const ForgotPasswordAndVerificationPhoneBody(namePage: 'Phone verification')
    );
  }
}
