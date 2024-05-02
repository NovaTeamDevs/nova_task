import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nova_task/core/resources/dimens.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({
    super.key,  this.isFirst,
  });
  final bool? isFirst;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 150.w,
          height: 110.h,
          decoration: BoxDecoration(
              color: context.theme.colorScheme.primaryContainer,
              borderRadius: BorderRadius.circular(Dimens.medium.r)
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 60.w,
                height: 60.h,
                decoration: BoxDecoration(
                    color: context.theme.colorScheme.primaryContainer,
                    borderRadius: BorderRadius.circular(Dimens.medium.r)
                ),
                child: Center(
                  child: Icon(Icons.access_alarms_sharp,size: 40,color: context.theme.colorScheme.primary.withOpacity(0.80),),
                ),
              ),
              SizedBox(height: Dimens.small.h),
              const Text("عنوان دسته بندی")
            ],
          ),
        ),
      ],
    );
  }
}