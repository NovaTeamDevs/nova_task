import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nova_task/core/resources/app_strings.dart';
import 'package:nova_task/core/resources/dimens.dart';
import 'package:nova_task/gen/assets.gen.dart';

class EmptyState extends StatelessWidget {
  const EmptyState({super.key,  this.height = 180});
  final double height;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(Assets.png.emptyState.path,height: height.h),
        SizedBox(height: Dimens.small.h),
        const Text(AppStrings.emptyStateMessage)
      ],
    );
  }
}
