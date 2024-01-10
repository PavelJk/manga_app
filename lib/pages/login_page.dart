import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:manga_app/components/errorMessange.dart';
import 'package:manga_app/components/vkYandexGoogleButton.dart';
import 'package:manga_app/components/validatorEmailAndPass.dart';
import 'package:manga_app/style/color_app.dart';
import 'package:manga_app/style/text_app.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isObscureText = true;
  bool _isRemember = false;
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  Future signIn() async{
    showDialog(
      context: context,
      builder:(context) => const Center(
        child: CircularProgressIndicator(
          color: ColorApp.violet,
        ),
      ), 
    );
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
      Navigator.pop(context);
    } on FirebaseAuthException catch (error) {
      ErrorMessange.showSnackBar(error.message);
      Navigator.pop(context);
    }
  }
@override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
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
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 14),
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
                        'Login',
                        style: TextStyleApp.headerThree,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.zero,
                        hintText: 'Enter your email',
                        prefixIcon: const Icon(
                          Icons.email,
                          color: ColorApp.blue,
                        ),
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        filled: true,
                        fillColor: ColorApp.white.withOpacity(0.8),
                        hintStyle: TextStyleApp.textField,
                      ),
                      validator: (email) => Validator().validateEmail(email),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      controller: _passwordController,
                      obscureText: _isObscureText,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.zero,
                        hintText: 'Enter your password',
                        hintStyle: TextStyleApp.textField,
                        prefixIcon: const Icon(
                          Icons.lock,
                          color: ColorApp.blue,
                        ),
                        suffixIcon: IconButton(
                          padding: const EdgeInsets.only(right: 10),
                          onPressed: () {
                            setState(() {
                              _isObscureText = !_isObscureText;
                            });
                          },
                          icon: _isObscureText
                              ? const Icon(Icons.visibility_off)
                              : const Icon(Icons.visibility),
                          color: ColorApp.blue,
                        ),
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        filled: true,
                        fillColor: ColorApp.white.withOpacity(0.8),
                      ),
                      validator: (password) => Validator().validateIsEmpty(password),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton.icon(
                          onPressed: () {
                            setState(() {
                              _isRemember = !_isRemember;
                            });
                          },
                          style: TextButton.styleFrom(
                            foregroundColor: ColorApp.violet,
                          ),
                          label: const Text('Remember me'),
                          icon: _isRemember
                              ? const Icon(
                                  Icons.check_box_outlined,
                                  size: 17,
                                )
                              : const Icon(
                                  Icons.check_box_outline_blank,
                                  size: 17,
                                ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pushNamed('forgotPassword');
                          },
                          style: TextButton.styleFrom(
                            foregroundColor: ColorApp.violet,
                          ),
                          child: const Text('Forgot Password?'),
                        ),
                      ],
                    ),
                    const Spacer(),
                    SizedBox(
                      width: double.infinity,
                      height: 47,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            signIn();
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0),
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(20)),
                              side: BorderSide(width: 1, color: ColorApp.white)),
                        ),
                        child: const Text(
                          'Enter',
                          style: TextStyleApp.bodyOne,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'OR',
                      style: TextStyleApp.bodeTwo,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        VkYandexGoogleButton(assetSvg: 'assets/svg/icons-yandex.svg'),
                        VkYandexGoogleButton(assetSvg: 'assets/svg/vk.svg'),
                        VkYandexGoogleButton(assetSvg: 'assets/svg/icons-google.svg'),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'No account?',
                          style: TextStyleApp.bodeTwo,
                        ),
                        TextButton(
                          onPressed:() {
                            Navigator.of(context).pushNamedAndRemoveUntil('signUp', (route) => false);
                          },
                          style: TextButton.styleFrom(
                            foregroundColor: ColorApp.violet,
                          ),
                          child: const Text(
                            'Sign Up',
                            style: TextStyle(decoration: TextDecoration.underline, fontSize: 15),
                          ),
                        ),
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
    ));
  }
}
