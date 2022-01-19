import 'package:flutter/material.dart';

InputDecoration buildInputDecoration(String hint, String iconPath) {
  return InputDecoration(
      focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Color.fromRGBO(252, 252, 252, 1))),
      hintText: hint,
      enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Color.fromRGBO(80, 80, 80, 1.0))),
      hintStyle: TextStyle(color: Color.fromRGBO(151, 151, 151, 1)),
      icon: iconPath != '' ? Image.asset(iconPath) : null,
      errorStyle: TextStyle(color: Color.fromRGBO(152, 0, 0, 1.0)),
      errorBorder: UnderlineInputBorder(
          borderSide: BorderSide(color:  Color.fromRGBO(152, 0, 0, 1.0))),
      focusedErrorBorder: UnderlineInputBorder(
          borderSide: BorderSide(color:  Color.fromRGBO(152, 0, 0, 1.0))));
}