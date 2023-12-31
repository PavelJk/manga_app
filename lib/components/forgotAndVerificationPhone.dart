import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:manga_app/components/validatorEmailAndPass.dart';
import 'package:manga_app/style/color_app.dart';
import 'package:manga_app/style/text_app.dart';

class ForgotPasswordAndVerificationPhoneBody extends StatefulWidget {
  final namePage;
  final namePathNavigator;
  const ForgotPasswordAndVerificationPhoneBody({super.key, this.namePage, this.namePathNavigator});

  @override
  State<ForgotPasswordAndVerificationPhoneBody> createState() => _ForgotPasswordAndVerificationPhoneBodyState();
}

class _ForgotPasswordAndVerificationPhoneBodyState extends State<ForgotPasswordAndVerificationPhoneBody> {
  final _formKey = GlobalKey<FormState>();
  var _numberPhone = '';
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (context, constraints) => SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: IntrinsicHeight(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                       '${widget.namePage}\nEnter your mobile number',
                       style: TextStyle(color: ColorApp.white, fontSize: 25),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Text(
                      'We will send you a text with a verification code',
                      style: TextStyle(color: Color.fromARGB(255, 225, 225, 225), fontSize: 15),
                    ),
                    const SizedBox(height: 25),
                    Form(
                      key: _formKey,
                      child: TextFormField(
                        cursorColor: ColorApp.violet,
                        inputFormatters: [FilteringTextInputFormatter.allow(RegExp('[0-9+]+'))],
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.zero,
                          border:  OutlineInputBorder(
                            borderRadius: BorderRadius.circular(40),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40),
                              borderSide:
                                  BorderSide(color: ColorApp.violet, width: 2)),
                          
                          prefixIcon: const Icon(
                            Icons.phone,
                            color: ColorApp.blue,
                            size: 20,
                          ),
                          filled: true,
                          hintStyle: TextStyleApp.textField,
                          fillColor: ColorApp.white.withOpacity(0.8),
                          hintText: '+1 000 000 0000',
                        ),
                        onChanged:(numberPhone) {
                          _numberPhone = numberPhone;
                        },
                        validator: (numberPhone) => Validator().validateNumberPhone(numberPhone),
                        keyboardType: TextInputType.phone,
                      ),
                    ),
                    const Spacer(),
                    SizedBox(
                      width: double.infinity,
                      height: 47,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            Navigator.of(context).pushNamed('verificationCode', arguments:{'path': widget.namePathNavigator, 'number':_numberPhone});
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0),
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              side: BorderSide(
                                  width: 1, color: ColorApp.white)),
                        ),
                        child: const Text(
                          'Next',
                          style: TextStyleApp.bodyOne,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
  }
}