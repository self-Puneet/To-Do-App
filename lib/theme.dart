import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  // primaryColor: Color.fromRGBO(95, 51, 225, 100),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      minimumSize: WidgetStatePropertyAll(Size(double.infinity, 50)),
      shape: WidgetStatePropertyAll(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      foregroundColor: WidgetStatePropertyAll(Colors.white),
      textStyle: WidgetStatePropertyAll(TextStyle(color: Colors.white)),
      iconAlignment: IconAlignment.end,
      iconColor: WidgetStatePropertyAll(Colors.white),
      backgroundColor: WidgetStatePropertyAll(Color.fromRGBO(95, 51, 225, 100)),
    ),
  ),
);
