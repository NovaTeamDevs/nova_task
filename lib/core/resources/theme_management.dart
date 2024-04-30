import 'package:flutter/material.dart';

class ThemeManagement {
  ThemeManagement._();
  
  static ThemeData lightTheme = ThemeData(
    fontFamily: "shabnam",
    colorScheme: ColorScheme.light(
      background: const Color(0xFFFFFFFF),
      primary: const Color(0xFF5B67CA),
      primaryContainer: const Color(0xFF5B67CA).withOpacity(0.30)
    ),
    textTheme: const TextTheme(
      titleMedium: TextStyle(fontSize: 18,fontWeight: FontWeight.w700)
    )
  );

}