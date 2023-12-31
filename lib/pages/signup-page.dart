import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:manga_app/components/errorMessange.dart';
import 'package:manga_app/components/vkYandexGoogleButton.dart';
import 'package:manga_app/components/validatorEmailAndPass.dart';
import 'package:manga_app/style/color_app.dart';
import 'package:manga_app/style/text_app.dart';

class SingUpPage extends StatefulWidget {
  const SingUpPage({super.key});

  @override
  State<SingUpPage> createState() => _SingUpPageState();
}

class _SingUpPageState extends State<SingUpPage> {
  bool isObscureText = true;
  bool isObscureTextRepeat = true;
  String _firstPassword = '';
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  Future singUp() async{
    showDialog(
      context: context,
      builder:(context) => const Center(
          child: CircularProgressIndicator(
            color: ColorApp.violet,
          ),
      ),
    );
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
      Navigator.of(context).pushNamed('verificationPhone').then((_){
          FirebaseAuth.instance.currentUser?.delete();
          Navigator.pop(context);
        }
      );
    } on FirebaseAuthException catch (error) {
      Navigator.pop(context);
      ErrorMessange.showSnackBar(error.message);
    }
  }
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
                child: Form(
                  key: _formKey,
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
                        controller: _emailController,
                        decoration: _textFieldInputDecoration(
                            'Enter your email', Icons.email),
                        validator: (email) =>
                            Validator().validateEmail(email),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                          decoration: _textFieldInputDecoration(
                              'Enter your username', Icons.person),
                        validator: (userName) => Validator().validateIsEmpty(userName)
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: _passwordController,
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
                              padding: const EdgeInsets.only(right: 10),
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
                          _firstPassword = value;
                        },
                        validator: (password) =>
                            Validator().validatePassword(password),
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
                              padding: const EdgeInsets.only(right: 10),
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
                        validator: (repeatPassword) => Validator().validateRepeatPassword(repeatPassword, _firstPassword),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pushNamedAndRemoveUntil('logIn', (route) => false);
                        },
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
                            if (_formKey.currentState!.validate()) {
                              singUp();
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0),
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
