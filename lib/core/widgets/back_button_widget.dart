import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:nova_task/core/resources/dimens.dart';

class BackButtonWidget extends StatelessWidget {
  const BackButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.back(),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: Dimens.small),
        width: 48.w,
        height: 48.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.r),
            color: const Color(0xFFFFFFFF),
            boxShadow: [
              BoxShadow(
                  color: context.theme.colorScheme.shadow,
                  blurRadius: 13,
                  offset: const Offset(-3,7)
              )
            ]
        ),
        child: Center(
          child: SvgPicture.asset("assets/svgs/ArrowLeft2.svg",height: 18.h,),
        ),
      ),
    );
  }
}