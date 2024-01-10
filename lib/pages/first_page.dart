import 'package:flutter/material.dart';
import 'package:manga_app/style/color_app.dart';
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
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 25),
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
                  _elevelenButton('Sign up', context ,'signUp'),
                  const SizedBox(
                    height: 20,
                  ),
                  _elevelenButton('Log in', context, 'auth'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
  Widget _elevelenButton(String nameButton, BuildContext context, String pathNameNavigator) {
    return SizedBox(
      width: double.infinity,
      height: 47,
      child: ElevatedButton(
        onPressed: () {
          Navigator.of(context).pushNamed(pathNameNavigator);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              side: BorderSide(width: 1, color: ColorApp.white)),
        ),
        child: Text(
          nameButton,
          style: TextStyleApp.bodyOne,
        ),
      ),
    );
  }
}
