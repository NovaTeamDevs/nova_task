import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:nova_task/controllers/category_controller.dart';
import 'package:nova_task/core/resources/app_colors.dart';
import 'package:nova_task/core/resources/app_strings.dart';
import 'package:nova_task/core/resources/dimens.dart';
import 'package:nova_task/core/widgets/app_button_widget.dart';
import 'package:nova_task/core/widgets/select_category_icon_widget.dart';
import 'package:nova_task/core/widgets/text_field_widget.dart';

class CreateCategoryBottomSheetWidget extends StatelessWidget {
  const CreateCategoryBottomSheetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 630.h,
      padding: const EdgeInsets.all(Dimens.pageMargin),
      width: double.infinity,
      child: SingleChildScrollView(
        child: GetBuilder<CategoryController>(
          init: CategoryController(),
          builder: (controller) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(AppStrings.addNewCategory,style: context.textTheme.titleMedium),
                // category title text field
                Padding(
                  padding: EdgeInsets.symmetric(vertical: Dimens.medium.h),
                  child: const TextFieldWidget(label: AppStrings.categoryNameLabel),
                ),
                // icon list
                Text(AppStrings.selectIconCategory,style: context.textTheme.titleMedium),
                SizedBox(height:Dimens.medium.h),
                Wrap(
                  children: List.generate(
                      controller.iconList.length, (index) {
                        return SelectCategoryIconWidget(
                          iconPath: controller.iconList[index],
                          onTap: () => controller.updateIcon(index),
                          selected: controller.selectedIcon == index,
                        );
                      }),
                ),
                SizedBox(height:Dimens.large.h),
                Text(AppStrings.selectCategoryColor,style: context.textTheme.titleMedium),
                SizedBox(height:Dimens.medium.h),
                // color picker
                SizedBox(
                  width: 250,
                  height: 160.h,
                  child: BlockPicker(
                    useInShowDialog: true,
                    availableColors: AppColors.availableColors,
                    pickerColor: Colors.black,
                    onColorChanged: (value) {},),
                ),
                // add category button
                AppButtonWidget(text: AppStrings.createNewCategory, onTap: () {},)
              ],
            );
          }
        ),
      ),
    );
  }
}


