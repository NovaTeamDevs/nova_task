import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nova_task/core/resources/app_strings.dart';
import 'package:nova_task/core/resources/dimens.dart';
import 'package:nova_task/core/widgets/app_chart_widget.dart';

class TodoChartScreen extends StatelessWidget {
  const TodoChartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
      padding: const EdgeInsets.all(Dimens.pageMargin),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            // today task chart
            Container(
              width: double.infinity,
              height: 300.h,
              padding: const EdgeInsets.all(Dimens.medium * 2),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.r),
                  color: const Color(0xFFF9FAFD),
                  boxShadow: [
                    BoxShadow(
                        color: context.theme.colorScheme.shadow,
                        blurRadius: 15,
                        offset: const Offset(-3, 7))
                  ]),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(AppStrings.todayTaskChartTitle,style: context.textTheme.titleMedium),
                  const AppChartWidget(todoTaskValue: 40,endTaskValue: 60,)
                ],
              ),
            ),
            SizedBox(height: Dimens.medium.h),
            // all task chart
            Container(
              width: double.infinity,
              height: 300.h,
              padding: const EdgeInsets.all(Dimens.medium * 2),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.r),
                  color: const Color(0xFFF9FAFD),
                  boxShadow: [
                    BoxShadow(
                        color: context.theme.colorScheme.shadow,
                        blurRadius: 15,
                        offset: const Offset(-3, 7))
                  ]),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(AppStrings.allTaskChartTitle,style: context.textTheme.titleMedium),
                  const AppChartWidget(todoTaskValue: 70,endTaskValue: 30,)
                ],
              ),
            ),

            SizedBox(height: 95.h,)
          ],
        ),
      ),
    ));
  }
}
