import 'package:flutter/material.dart';
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
  bool isobscureText = true;
  bool isRemember = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: LayoutBuilder(
      builder: (context, constraints) => SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(minHeight: constraints.maxHeight),
          child: IntrinsicHeight(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
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
                    validator: (email) => ValidatorChek().validateEmail(email),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    obscureText: isobscureText,
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
                            isobscureText = !isobscureText;
                          });
                        },
                        icon: isobscureText
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
                    validator: (password) =>
                        ValidatorChek().validatePassword(password),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton.icon(
                        onPressed: () {
                          setState(() {
                            isRemember = !isRemember;
                          });
                        },
                        style: TextButton.styleFrom(
                          foregroundColor: ColorApp.violet,
                        ),
                        label: const Text('Remember me'),
                        icon: isRemember
                            ? const Icon(
                                Icons.check_box_outline_blank,
                                size: 17,
                              )
                            : const Icon(
                                Icons.check_box_outlined,
                                size: 17,
                              ),
                      ),
                      TextButton(
                        onPressed: () {},
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
                        Navigator.of(context).pushNamed("verificationPhone");
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ColorApp.violet.withOpacity(0),
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
                  const Spacer(),
                ],
              ),
            ),
          ),
        ),
      ),
    ));
  }
}
