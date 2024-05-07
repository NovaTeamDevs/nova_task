import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nova_task/controllers/task_controller.dart';
import 'package:nova_task/core/resources/app_strings.dart';
import 'package:nova_task/core/resources/dimens.dart';
import 'package:nova_task/core/widgets/select_category_bottom_sheet_widget.dart';

class SelectCategoryButton extends StatelessWidget {
  const SelectCategoryButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(context: context, builder: (context) => const SelectCategoryBottomSheetWidget());
      },
      child: Container(
          width: double.infinity,
          height: 48.h,
          padding: const EdgeInsets.symmetric(horizontal: Dimens.medium),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.r),
              color: const Color(0xFFFFFFFF),
              boxShadow: [
                BoxShadow(
                    color: context.theme.colorScheme.shadow,
                    blurRadius: 15,
                    offset: const Offset(-3, 7))
              ]),
          child: GetBuilder<TaskController>(
            builder: (controller) {
              return  Row(
                children: [
                  Text(
                     controller.category == null? AppStrings.selectCategory : controller.category!.title!),
                  const Spacer(),
                  const Icon(Icons.arrow_drop_down)
                ],
              );
            }
          )),
    );
  }
}