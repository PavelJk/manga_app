import 'package:flutter/material.dart';
import 'package:manga_app/components/eleventButton.dart';
import 'package:manga_app/components/validatorEmailAndPass.dart';
import 'package:manga_app/style/color_app.dart';
import 'package:manga_app/style/text_app.dart';

class SingupPage extends StatefulWidget {
  const SingupPage({super.key});

  @override
  State<SingupPage> createState() => _SingupPageState();
}

class _SingupPageState extends State<SingupPage> {
  bool isObscureText = true;
   bool isObscureTextRepeat = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text(
            'MANGA',
            style: TextStyleApp.headerTwo,
          ),
          Text(
            'FLIX',
            style: TextStyleApp.headerOne,
          ),
          const SizedBox(
            height: 25,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Sign up',
              style: TextStyleApp.headerTwo,
            ),
          ),
          TextFormField(
            decoration:
                _textFieldInputDecoration('Enter your email', Icons.email),
            validator: (email) => ValidatorChek().validateEmail(email),
            autovalidateMode: AutovalidateMode.onUserInteraction,
          ),
          TextFormField(
              decoration: _textFieldInputDecoration('Enter your username', Icons.person)),
          TextFormField(
            decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                prefixIcon: Icon(
                  Icons.lock,
                  color: ColorApp.blue,
                ),
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      isObscureText = !isObscureText;
                    });
                  },
                  icon: isObscureText
                      ? Icon(Icons.visibility_off)
                      : Icon(Icons.visibility),
                  color: ColorApp.blue,
                ),
                hintText: 'Enter your password',
                hintStyle: TextStyleApp.textField,
                filled: true,
                fillColor: ColorApp.white.withOpacity(0.8)),
            obscureText: isObscureText,
            validator: (password) => ValidatorChek().validatePassword(password),
            autovalidateMode: AutovalidateMode.onUserInteraction,
          ),
          TextButton(
            onPressed:() {
              
            },
            style: TextButton.styleFrom(
              foregroundColor: ColorApp.violet,
            ),
            child: Text(
              'There is an account',
              style: TextStyle(decoration: TextDecoration.underline)
            ), 
          ),
          CreateEleventButton().firstOrLogOrSignPage(nameButton: 'Enter', context: context, pathNameNavigator: 'home'),
          Text(
            'OR',
            style: TextStyleApp.bodeTwo,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CreateEleventButton().googleYandexVK(assetSvg: 'assets/svg/icons-yandex.svg'),
              CreateEleventButton().googleYandexVK(assetSvg: 'assets/svg/vk.svg'),
              CreateEleventButton().googleYandexVK(assetSvg: 'assets/svg/icons-google.svg'),
            ],
          ),
        ],
      ),
    );
  }

  InputDecoration _textFieldInputDecoration(
      String fieldName, IconData nameIcon) {
    return InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        prefixIcon: Icon(
          nameIcon,
          color: ColorApp.blue,
        ),
        hintText: fieldName,
        hintStyle: TextStyleApp.textField,
        filled: true,
        fillColor: ColorApp.white.withOpacity(0.8));
  }
}
