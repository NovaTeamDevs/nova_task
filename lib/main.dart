import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:nova_task/controllers/splash_controller.dart';
import 'package:nova_task/core/resources/app_strings.dart';
import 'package:nova_task/core/resources/storage_key.dart';
import 'package:nova_task/core/resources/theme_management.dart';
import 'package:nova_task/models/category_model.dart';
import 'package:nova_task/models/task_model.dart';
import 'package:nova_task/views/main_screen.dart';
import 'package:nova_task/views/splash_screen.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(ColorAdapter());
  Hive.registerAdapter(CategoryModelAdapter());
  Hive.registerAdapter(TaskModelAdapter());
  await Hive.openBox<CategoryModel>(StorageKeys.categoryBox);
  await Hive.openBox<TaskModel>(StorageKeys.taskBox);
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


