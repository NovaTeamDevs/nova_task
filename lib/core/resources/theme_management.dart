import 'package:flutter/material.dart';

class ThemeManagement {
  ThemeManagement._();
  
  static ThemeData lightTheme = ThemeData(
    fontFamily: "shabnam",
    colorScheme: ColorScheme.light(
      background: const Color(0xFFFFFFFF),
      primary: const Color(0xFF5B67CA),
      shadow: Color(0xFFF1F7FF),
      primaryContainer: const Color(0xFF5B67CA).withOpacity(0.30)
    ),
    navigationBarTheme: const NavigationBarThemeData(
      backgroundColor: Colors.white,

    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFFFFFFFF),
      surfaceTintColor: Color(0xFFFFFFFF),
      titleTextStyle: TextStyle(fontFamily: "shabnam",fontSize: 16,fontWeight: FontWeight.w700,color: Color(0xFF10275A)),
    ),
    textTheme: const TextTheme(
      titleMedium: TextStyle(fontSize: 18,fontWeight: FontWeight.w700,color: Color(0xFF10275A)),
      bodyMedium: TextStyle(color: Color(0xFF10275A)),
      bodySmall: TextStyle(color: Color(0xFF575757),fontSize: 12,fontWeight: FontWeight.w400)
    )
  );

}