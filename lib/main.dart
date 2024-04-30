import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nova_task/core/resources/app_strings.dart';
import 'package:nova_task/core/resources/theme_management.dart';
import 'package:nova_task/views/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        locale: const Locale("fa"),
        title: AppStrings.appName,
        theme: ThemeManagement.lightTheme,
        home: const SplashScreen(),
      ),
    );
  }
}


