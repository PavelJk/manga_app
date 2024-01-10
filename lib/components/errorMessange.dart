
import 'package:flutter/material.dart';
class ErrorMessange {
  static final messangerKey = GlobalKey<ScaffoldMessengerState>();

  static showSnackBar(String? messange){
    if (messange == null) return;
    final snackBar = SnackBar(content: Text(messange), backgroundColor: Colors.red,);
    messangerKey.currentState!
      ..removeCurrentSnackBar()
      ..showSnackBar(snackBar);
  } 
}