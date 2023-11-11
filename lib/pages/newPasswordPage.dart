import 'package:flutter/material.dart';
import 'package:manga_app/components/validatorEmailAndPass.dart';
import 'package:manga_app/style/color_app.dart';
import 'package:manga_app/style/text_app.dart';

class CreateNewPasswordPage extends StatefulWidget {
  const CreateNewPasswordPage({super.key});

  @override
  State<CreateNewPasswordPage> createState() => _CreateNewPasswordPageState();
}

class _CreateNewPasswordPageState extends State<CreateNewPasswordPage> {
  bool _isObscureTextOne = true;
  bool _isObscureTextTwo = true;
  String _firstPassword = '';
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorApp.backgroundApp,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) => SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: IntrinsicHeight(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 20),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Create new password',
                        style: TextStyle(color: ColorApp.white, fontSize: 25),
                      ),
                      const SizedBox(height: 15),
                      const Text(
                        'Please enter and confirm your new password',
                        style: TextStyle(color: Color.fromARGB(255, 225, 225, 225), fontSize: 15),
                      ),
                      const SizedBox(height: 25),
                      const Text(
                        'New password',
                        style: TextStyle(color: ColorApp.white, fontSize: 20),
                      ),
                      const SizedBox(height: 8),
                      TextFormField(
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(horizontal: 15),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(40)
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(40),
                            borderSide: const BorderSide(color: ColorApp.violet, width: 2)
                          ),
                          suffixIcon: IconButton(
                            padding: const EdgeInsets.only(right: 10),
                            onPressed: () {
                              setState(() {
                                _isObscureTextOne = !_isObscureTextOne;
                              });
                            },
                            icon: _isObscureTextOne ? const Icon(Icons.visibility_off) : const Icon(Icons.visibility),
                            color: ColorApp.blue,
                          ),
                          filled: true,
                          fillColor: ColorApp.white.withOpacity(0.8),
                        ),
                        style: const TextStyle(fontSize: 20),
                        obscureText: _isObscureTextOne,
                        cursorColor: ColorApp.violet,
                        onChanged: (password) {
                          _firstPassword = password;
                        },
                        validator: (password) => Validator().validatePassword(password),
                      ),
                      const SizedBox(height: 12),
                      const Text(
                        'Confirm new password',
                        style: TextStyle(color: ColorApp.white, fontSize: 20),
                      ),
                      const SizedBox(height: 8),
                      TextFormField(
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(horizontal: 15),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(40)
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(40),
                            borderSide: const BorderSide(color: ColorApp.violet, width: 2)
                          ),
                          suffixIcon: IconButton(
                            padding: const EdgeInsets.only(right: 10),
                            onPressed: () {
                              setState(() {
                                _isObscureTextTwo = !_isObscureTextTwo;
                              });
                            },
                            icon: _isObscureTextTwo ? const Icon(Icons.visibility_off) : const Icon(Icons.visibility),
                            color: ColorApp.blue,
                          ),
                          filled: true,
                          fillColor: ColorApp.white.withOpacity(0.8),
                        ),
                        style: const TextStyle(fontSize: 20, color: ColorApp.blue),
                        obscureText: _isObscureTextTwo,
                        cursorColor: ColorApp.violet,
                        validator: (repeatPassword) => Validator().validateRepeatPassword(repeatPassword, _firstPassword),
                      ),
                      const SizedBox(height: 20),
                      const Spacer(),
                      SizedBox(
                        width: double.infinity,
                        height: 47,
                        child: ElevatedButton(
                          onPressed:() {
                            if (_formKey.currentState!.validate()) {
                              Navigator.of(context).pushReplacementNamed('logIn');
                            }
                          },
                           style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                              side: const BorderSide(color: ColorApp.white)
                            ),
                           ),
                           child: const Text(
                            'Reset password',
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
        ),
      ),
    );
  }
}