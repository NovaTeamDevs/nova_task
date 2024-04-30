import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
      body: Stack(
        children: [
          const IndexedStack(
            index: 0,
            children: [
              HomeScreen(),
              TodoChartScreen(),
              TodoChartScreen(),
              CategoryScreen()
            ],
          ),
          Positioned(
            bottom: Dimens.large.h,
              left: Dimens.large.w,
              right: Dimens.large.w,
              child:  BottomNavigation(
                selectedIndex: 0,
                onChange: (newIndex) {

                },
              )),
        ],
      ),
    );
  }
}
