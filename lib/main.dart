import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:manga_app/components/errorMessange.dart';
import 'package:manga_app/firebase_options.dart';
import 'package:manga_app/pages/auth.dart';
import 'package:manga_app/pages/first_page.dart';
import 'package:manga_app/pages/forgotPassword_page.dart';
import 'package:manga_app/pages/home_page.dart';
import 'package:manga_app/pages/login_page.dart';
import 'package:manga_app/pages/newPasswordPage.dart';
import 'package:manga_app/pages/signup-page.dart';
import 'package:manga_app/pages/verification%E2%80%A8Code_page.dart';
import 'package:manga_app/pages/verification%E2%80%A8Phone_page.dart';
import 'package:manga_app/style/color_app.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scaffoldMessengerKey: ErrorMessange.messangerKey,
      theme: ThemeData(
          scaffoldBackgroundColor: ColorApp.backgroundApp,
          fontFamily: 'NotoSans'
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const FirstPage(),
        'auth':(context) => const Auth(),
        'logIn': (context) => const LoginPage(),
        'signUp': (context) => const SingUpPage(),
        'verificationPhone': (context) => const VerificationPhonePage(),
        'forgotPassword': (context) => const ForgotPasswordPage(),
        'verificationCode': (context) => const VerificationCodePage(),
        'newPassword': (context) => const CreateNewPasswordPage(),
        'home':(context) => const HomePage(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}