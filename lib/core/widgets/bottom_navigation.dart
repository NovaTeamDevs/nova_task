import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:nova_task/controllers/nvaigation_controller.dart';
import 'package:nova_task/core/resources/dimens.dart';
import 'package:nova_task/views/add_or_edit_task.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({super.key, required this.onChange});
  final Function(int newIndex) onChange;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<NavigationController>(
      builder: (controller) {
        return Container(
          width: double.infinity,
          height: 60.h,
          decoration: BoxDecoration(
              color: context.theme.navigationBarTheme.backgroundColor,
              borderRadius: BorderRadius.circular(Dimens.medium.r),
              boxShadow: const [
                BoxShadow(
                  color: Color(0xFFD1E4FC),
                  blurRadius: 13,
                  offset: Offset(-3,7)
                )
              ],

          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // home
              _NavItemWidget(
                onTap: () => onChange(0),
                selected: controller.selectedIndex == 0,
                iconPath: "assets/svgs/Iconly-Curved-Home.svg",
              ),

              _NavItemWidget(
                onTap: () => onChange(1),
                selected: controller.selectedIndex == 1,
                iconPath: "assets/svgs/Document.svg",
              ),

              GestureDetector(
                onTap: () => Get.to(const AddOrEditTaskScreen()),
                child: Container(
                  width: 50.w,
                  height: 50.h,
                  decoration: BoxDecoration(
                    color: context.theme.colorScheme.primary,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(CupertinoIcons.add,color: Colors.white),
                ),
              ),

              _NavItemWidget(
                onTap: () => onChange(2),
                selected: controller.selectedIndex == 2,
                iconPath: "assets/svgs/Activity.svg",
              ),

              _NavItemWidget(
                onTap: () => onChange(3),
                selected: controller.selectedIndex == 3,
                iconPath: "assets/svgs/Iconly-Curved-Folder.svg",
              ),


            ],
          ),
        );
      }
    );
  }
}

class _NavItemWidget extends StatelessWidget {
  const _NavItemWidget({
    super.key, required this.iconPath, required this.onTap, this.selected = false,
  });
  final String iconPath;
  final VoidCallback onTap;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
              iconPath,
            height: 22.h,
            colorFilter:  ColorFilter.mode(
              selected?  context.theme.colorScheme.primary : const Color(0xFFC6CEDD),
                BlendMode.srcIn),
          ),
          SizedBox(height: (Dimens.small - 4).h,),
          AnimatedContainer(
              duration: 500.milliseconds,
              width: selected? 8.w : 0,
            height: selected? 8.w : 0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: context.theme.colorScheme.primary
            ),
          )
        ],
      ),
    );
  }
}