import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nova_task/core/resources/dimens.dart';

class TaskCardWidget extends StatelessWidget {
  const TaskCardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(Dimens.small),
      width: double.infinity,
      height: 90.h,
      decoration: BoxDecoration(
          color: context.theme.colorScheme.primary.withOpacity(0.10),
          borderRadius: BorderRadius.circular(Dimens.medium.r)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // title and description
          Row(
            children: [
              Column(
                children: [
                  Text("عنوان وظبفه",style: context.textTheme.titleMedium),
                  SizedBox(height: (Dimens.small - 4).h),
                  Text("توضیحات وظیفه",style: context.textTheme.bodySmall)
                ],
              ),
              const Spacer(),
              Checkbox(
                value: false,
                onChanged: (value) {},

              )
            ],
          ),
          SizedBox(height: Dimens.medium.h),
          // category name
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              width: 75.w,
              height: 20.h,
              decoration: BoxDecoration(
                  color: context.theme.colorScheme.primary.withOpacity(0.35),
                  borderRadius: BorderRadius.circular(Dimens.small.r)
              ),
              child: Center(child: Text("دسته بندی",style: context.textTheme.bodyMedium!.copyWith(
                  color: context.theme.colorScheme.primary
              ),)),
            ),
          )
        ],
      ),
    );
  }
}