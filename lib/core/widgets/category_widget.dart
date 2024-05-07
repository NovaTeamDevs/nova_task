import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nova_task/core/resources/dimens.dart';
import 'package:nova_task/models/category_model.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({
    super.key,  this.isFirst, required this.category,
  });
  final bool? isFirst;
  final CategoryModel category;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 150.w,
          height: 110.h,
          decoration: BoxDecoration(
              color: category.bgColor?.withOpacity(0.30),
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
                    color: category.bgColor,
                    borderRadius: BorderRadius.circular(Dimens.medium.r)
                ),
                child: Center(
                  child: SvgPicture.asset(
                    category.iconPath!,
                    height: 32.h,
                    colorFilter: ColorFilter.mode(Colors.white70, BlendMode.srcIn),
                  )
                ),
              ),
              SizedBox(height: Dimens.small.h),
              Text(category.title!)
            ],
          ),
        ),
      ],
    );
  }
}