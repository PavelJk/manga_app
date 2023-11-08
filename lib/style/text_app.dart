import 'package:flutter/material.dart';
import 'package:manga_app/style/color_app.dart';

class TextStyleApp {
  static const headerOne = TextStyle(
    color: ColorApp.violet,
    height: 1,
    fontSize: 68,
    fontWeight: FontWeight.bold,
  );
  static const headerTwo = TextStyle(
    color: ColorApp.white,
    fontSize: 37,
    fontWeight: FontWeight.bold,
  );
  static const headerThree = TextStyle(
    color: ColorApp.white,
    fontSize: 26,
    fontWeight: FontWeight.bold,
  );
  static const bodyOne = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );
  static const textField = TextStyle(
    color: ColorApp.blue,
    fontSize: 15,
    fontWeight: FontWeight.w400,
  );
  static const bodeTwo = TextStyle(
    fontSize: 15,
    color: ColorApp.white,
  );
}