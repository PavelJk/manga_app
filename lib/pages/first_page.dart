import 'package:flutter/material.dart';
import 'package:manga_app/components/eleventButton.dart';
//import 'package:manga_app/style/color_app.dart';
import 'package:manga_app/style/text_app.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            width: 680,
            height: 680,
            child: Opacity(
              opacity: 0.5,
              child: Image.asset('assets/png/levi.png'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 30),
            child: Center(
              child: Column(
                children: [
                  const Spacer(),
                  const Text(
                    'MANGA',
                    style: TextStyleApp.headerTwo,
                  ),
                  const Text(
                    'FLIX',
                    style: TextStyleApp.headerOne,
                  ),
                  const Spacer(),
                  CreateEleventButton().firstOrLogOrSignPage(nameButton: 'Sign up', context: context, pathNameNavigator: 'signup'),
                  const SizedBox(
                    height: 20,
                  ),
                  CreateEleventButton().firstOrLogOrSignPage(nameButton: 'Log in', context: context, pathNameNavigator: 'login'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
