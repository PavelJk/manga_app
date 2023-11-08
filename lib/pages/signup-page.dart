import 'package:flutter/material.dart';
import 'package:manga_app/components/vkYandexGoogleButton.dart';
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
  String _passwordForChek = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) => SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: IntrinsicHeight(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
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
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Sign up',
                        style: TextStyleApp.headerThree,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      decoration: _textFieldInputDecoration(
                          'Enter your email', Icons.email),
                      validator: (email) =>
                          ValidatorChek().validateEmail(email),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                        decoration: _textFieldInputDecoration(
                            'Enter your username', Icons.person)),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.zero,
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          prefixIcon: const Icon(
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
                                ? const Icon(Icons.visibility_off)
                                : const Icon(Icons.visibility),
                            color: ColorApp.blue,
                          ),
                          hintText: 'Enter your password',
                          hintStyle: TextStyleApp.textField,
                          filled: true,
                          fillColor: ColorApp.white.withOpacity(0.8)),
                      obscureText: isObscureText,
                      onChanged: (value) {
                        _passwordForChek = value;
                      },
                      validator: (password) =>
                          ValidatorChek().validatePassword(password),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      obscureText: isObscureTextRepeat,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.zero,
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          prefixIcon: const Icon(
                            Icons.lock,
                            color: ColorApp.blue,
                          ),
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                isObscureTextRepeat = !isObscureTextRepeat;
                              });
                            },
                            icon: isObscureTextRepeat
                                ? const Icon(Icons.visibility_off)
                                : const Icon(Icons.visibility),
                            color: ColorApp.blue,
                          ),
                          hintText: 'Enter repeat password',
                          hintStyle: TextStyleApp.textField,
                          filled: true,
                          fillColor: ColorApp.white.withOpacity(0.8)),
                      validator: (repeatPassword) =>
                          _passwordForChek != repeatPassword
                              ? 'The password doesn`t match'
                              : null,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                    ),
                    TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        foregroundColor: ColorApp.violet,
                      ),
                      child: const Text('There is an account',
                          style:
                              TextStyle(decoration: TextDecoration.underline)),
                    ),
                    const Spacer(),
                    SizedBox(
                      width: double.infinity,
                      height: 47,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed("verificationPhone");
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: ColorApp.violet.withOpacity(0),
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              side:
                                  BorderSide(width: 1, color: ColorApp.white)),
                        ),
                        child: const Text(
                          'Enter',
                          style: TextStyleApp.bodyOne,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Text(
                      'OR',
                      style: TextStyleApp.bodeTwo,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        VkYandexGoogleButton(
                            assetSvg: 'assets/svg/icons-yandex.svg'),
                        VkYandexGoogleButton(assetSvg: 'assets/svg/vk.svg'),
                        VkYandexGoogleButton(
                            assetSvg: 'assets/svg/icons-google.svg'),
                      ],
                    ),
                    const Spacer(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  InputDecoration _textFieldInputDecoration(
      String fieldName, IconData nameIcon) {
    return InputDecoration(
        contentPadding: EdgeInsets.zero,
        border: const OutlineInputBorder(
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
