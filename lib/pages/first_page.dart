import 'package:flutter/material.dart';
import 'package:manga_app/style/color_app.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 30),
        child: Center(
          child: Column(
            children: [
              Spacer(),
              Text(
                'MANGA',
                style: TextStyle(
                  color: ColorApp.white,
                  fontSize: 45,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'FLIX',
                style: TextStyle(
                  color: ColorApp.violet,
                  fontSize: 82,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Spacer(),
              SizedBox(
                width: double.infinity,
                height: 43,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorApp.violet.withOpacity(0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        side: BorderSide(width: 1, color: ColorApp.white)),
                  ),
                  child: Text(
                    'Log up',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                width: double.infinity,
                height: 43,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorApp.violet.withOpacity(0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        side: BorderSide(width: 1, color: ColorApp.white)),
                  ),
                  child: Text(
                    'Log in',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
             
            ],
          ),
        ),
      ),
    );
  }
}
