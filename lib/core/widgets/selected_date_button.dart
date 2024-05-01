import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class SelectedDateButton extends StatelessWidget {
  const SelectedDateButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
        child: SvgPicture.asset("assets/svgs/Calendar.svg",height: 22.h,),
      ),
    );
  }
}
