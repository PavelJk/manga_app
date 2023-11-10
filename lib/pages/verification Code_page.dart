import 'package:flutter/material.dart';
import 'package:manga_app/style/color_app.dart';
import 'package:pinput/pinput.dart';

class VerificationCodePage extends StatefulWidget {
  
  const VerificationCodePage({super.key});

  @override
  State<VerificationCodePage> createState() => _VerificationCodePageState();
}

class _VerificationCodePageState extends State<VerificationCodePage> {
  final numberPhone = '+1 718 656 4012';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorApp.backgroundApp,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Enter code',
              style: TextStyle(color: ColorApp.white, fontSize: 25),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              'Code sent to you mobile number\n$numberPhone',
              style: TextStyle(color: ColorApp.white, fontSize: 15),
            ),
            const SizedBox(
              height: 40,
            ),
            Pinput(
              length: 6,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              defaultPinTheme: PinTheme(
                width: 60,
                height: 60,
                textStyle: TextStyle(
                  fontSize: 25,
                  color: ColorApp.blue
                ),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: ColorApp.white.withOpacity(0.8),
                  border: Border.all(
                    color: ColorApp.violet,
                    width: 2,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}