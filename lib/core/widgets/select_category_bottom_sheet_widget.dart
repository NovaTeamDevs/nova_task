import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:nova_task/controllers/task_controller.dart';
import 'package:nova_task/core/resources/dimens.dart';
import 'package:nova_task/models/category_model.dart';

class SelectCategoryBottomSheetWidget extends StatelessWidget {
  const SelectCategoryBottomSheetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TaskController>(
      builder: (taskController) {
        return Padding(
          padding: const EdgeInsets.all(Dimens.pageMargin),
          child: Column(
            children: [
              Expanded(
                child: ValueListenableBuilder(
                    valueListenable: taskController.categoryBoxBox.listenable(),
                    builder: (context, box, child) {
                      return ListView.builder(
                        itemCount: box.values.toList().length,
                          itemBuilder: (context, index) {
                          final CategoryModel category = box.values.toList()[index];
                            return _SelectCategoryListItem(
                                category: category,
                                onTap: () => taskController.updateCategory(index, category),
                                selected: taskController.selectedCategoryIndex == index,
                            );
                          },
                      );
                    },),
              )
            ],
          ),
        );
      }
    );
  }
}

class _SelectCategoryListItem extends StatelessWidget {
  const _SelectCategoryListItem({
    super.key,
    required this.category, required this.onTap,  this.selected = false,
  });

  final CategoryModel category;
  final VoidCallback onTap;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: Dimens.small.h),
        width: double.infinity,
        height: 45.h,
        decoration: BoxDecoration(
          border: Border.all(color: category.bgColor!),
          color: selected? category.bgColor : null,
          borderRadius: BorderRadius.circular(Dimens.medium.r)
        ),
        child: Center(
          child: Text(category.title!),
        ),
      ),
    );
  }
}
