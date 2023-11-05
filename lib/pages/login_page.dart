import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
        body: SingleChildScrollView(
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            children: [
              const Spacer(),
              Text(
                'MANGA',
                style: TextStyleApp.headerTwo,
              ),
              Text(
                'FLIX',
                style: TextStyleApp.headerOne,
              ),
              const Spacer(),
              Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  'Login',
                  style: TextStyleApp.headerTwo,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Enter your email',
                  prefixIcon: Icon(
                    Icons.email,
                    color: ColorApp.blue,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  filled: true,
                  fillColor: ColorApp.white.withOpacity(0.8),
                  hintStyle: TextStyleApp.textField,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              TextField(
                obscureText: isobscureText,
                decoration: InputDecoration(
                  hintText: 'Enter your password',
                  hintStyle: TextStyleApp.textField,
                  prefixIcon: Icon(
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
                        ? Icon(Icons.visibility_off)
                        : Icon(Icons.visibility),
                    color: ColorApp.blue,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  filled: true,
                  fillColor: ColorApp.white.withOpacity(0.8),
                ),
              ),
              const SizedBox(
                height: 5,
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
                    label: Text('Remember me'),
                    icon: isRemember
                        ? Icon(
                            Icons.check_box_outline_blank,
                            size: 17,
                          )
                        : Icon(
                            Icons.check_box_outlined,
                            size: 17,
                          ),
                  ),
                  TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      foregroundColor: ColorApp.violet,
                    ),
                    child: Text('Forgot Password?'),
                  ),
                ],
              ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                height: 47,
                child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColorApp.white.withOpacity(0),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          side: BorderSide(color: ColorApp.white)),
                    ),
                    child: Text(
                      'Enter',
                      style: TextStyle(fontSize: 20),
                    )),
              ),
              const SizedBox(
                height: 25,
              ),
              Text(
                'OR',
                style: TextStyle(color: ColorApp.white, fontSize: 15),
              ),
              const SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: 60,
                    height: 60,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white.withOpacity(0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(35)),
                          side: BorderSide(color: ColorApp.violet),
                        ),
                      ),
                      child: SvgPicture.asset('assets/svg/icons-yandex.svg'),
                    ),
                  ),
                  SizedBox(
                    width: 60,
                    height: 60,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white.withOpacity(0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(35)),
                          side: BorderSide(color: ColorApp.violet),
                        ),
                      ),
                      child: SvgPicture.asset('assets/svg/vk.svg'),
                    ),
                  ),
                  SizedBox(
                    width: 60,
                    height: 60,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white.withOpacity(0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(35)),
                          side: BorderSide(color: ColorApp.violet),
                        ),
                      ),
                      child: SvgPicture.asset('assets/svg/icons-google.svg'),
                    ),
                  ),
                ],
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    ));
  }
}
