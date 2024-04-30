import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:nova_task/controllers/nvaigation_controller.dart';
import 'package:nova_task/core/resources/dimens.dart';
import 'package:nova_task/core/widgets/bottom_navigation.dart';
import 'package:nova_task/views/category_screen.dart';
import 'package:nova_task/views/home_screen.dart';
import 'package:nova_task/views/todo_chart_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: GetBuilder<NavigationController>(
        init: NavigationController(),
        builder: (controller) {
          return Stack(
            children: [
               IndexedStack(
                index: controller.selectedIndex,
                children: [
                  const HomeScreen(),
                  const TodoChartScreen(),
                  const TodoChartScreen(),
                  const CategoryScreen()
                ],
              ),
              Positioned(
                bottom: Dimens.large.h,
                  left: Dimens.large.w,
                  right: Dimens.large.w,
                  child:  BottomNavigation(
                    onChange: controller.changeIndex,
                  )),
            ],
          );
        }
      ),
    );
  }
}
