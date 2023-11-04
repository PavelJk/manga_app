import 'package:flutter/material.dart';
import 'package:manga_app/pages/first_page.dart';
import 'package:manga_app/style/color_app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: ColorApp.backgroundApp,
      ),
      initialRoute: '/',
      routes: {
        '/':(context) => const FirstPage(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}

