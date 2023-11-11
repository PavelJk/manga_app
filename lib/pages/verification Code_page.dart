// ignore_for_file: unused_field
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:manga_app/style/color_app.dart';
import 'package:pinput/pinput.dart';

class VerificationCodePage extends StatefulWidget {
  
  const VerificationCodePage({super.key});

  @override
  State<VerificationCodePage> createState() => _VerificationCodePageState();
}

class _VerificationCodePageState extends State<VerificationCodePage> {
  bool _isResendAgain = false;
  String _code = '123456';
  final _formKey = GlobalKey<FormState>();
  late Timer _timer;
  int _start = 60;
  void resend(){
    setState(() {
      _isResendAgain = true;
    });
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(oneSec, (timer) {
        setState(() {
          if (_start == 0) {
            _start = 60;
            _isResendAgain = false;
            timer.cancel();
          }else{
            _start--;
          }
        });
     }
     );
  }
 
  @override
  Widget build(BuildContext context) {
    final _namePathNavigatorAndNumberPhone = (ModalRoute.of(context)?.settings.arguments ?? <String, dynamic>{'path' : '', 'number' : ''}) as Map<String, dynamic>;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorApp.backgroundApp,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) => SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 20),
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: IntrinsicHeight(
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
                      'Code sent to you mobile number\n' + _namePathNavigatorAndNumberPhone['number'],
                      style: TextStyle(color: ColorApp.white, fontSize: 15),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Form(
                      key: _formKey,
                      child: Pinput(
                        length: 6,
                        showCursor: false,
                        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        defaultPinTheme: PinTheme(
                          width: 50,
                          height: 50,
                          textStyle: TextStyle(
                            fontSize: 24,
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
                        validator:(pin) {
                          if (pin != _code) {
                            return 'Incorrect code';
                          }else{
                            Navigator.of(context).pushNamed(_namePathNavigatorAndNumberPhone['path']);
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(height: 60,),
                    Center(
                      child: TextButton(
                        onPressed:() {
                          setState(() {
                            if (_isResendAgain) return;
                            resend();
                          });
                        },
                        child: Text(_isResendAgain ? 'Resend code in $_start' : 'Resend code',
                          style: TextStyle(color: ColorApp.violet, fontSize: 17)
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}