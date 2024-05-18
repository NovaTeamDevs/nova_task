import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nova_task/controllers/main_controller.dart';
import 'package:nova_task/core/resources/app_colors.dart';
import 'package:nova_task/core/resources/app_strings.dart';
import 'package:nova_task/core/resources/dimens.dart';
import 'package:nova_task/core/widgets/app_chart_widget.dart';

class ChartsTaskWidget extends StatelessWidget {
  const ChartsTaskWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final MainController controller = Get.find<MainController>();
    return Column(
      children: [
        // today task chart
        Container(
          width: double.infinity,
          height: 300.h,
          padding: const EdgeInsets.all(Dimens.medium * 2),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.r),
            color: AppColors.lightRedColor.withOpacity(0.10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(AppStrings.todayTaskChartTitle,style: context.textTheme.titleMedium),
              AppChartWidget(todoTaskValue:  controller.todayTaskNotDone?.toDouble() ?? 0,endTaskValue: controller.todayTaskDone?.toDouble() ?? 0,)
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
            color: AppColors.blueColor.withOpacity(0.15),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(AppStrings.allTaskChartTitle,style: context.textTheme.titleMedium),
              AppChartWidget(todoTaskValue:  controller.allTaskNotDone?.toDouble() ?? 0,endTaskValue: controller.allTaskDone?.toDouble() ?? 0,)

            ],
          ),
        ),

        SizedBox(height: 95.h,)
      ],
    );
  }
}