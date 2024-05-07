import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:nova_task/controllers/category_controller.dart';
import 'package:nova_task/controllers/main_controller.dart';
import 'package:nova_task/controllers/nvaigation_controller.dart';
import 'package:nova_task/core/resources/app_strings.dart';
import 'package:nova_task/core/resources/dimens.dart';
import 'package:nova_task/core/widgets/category_widget.dart';
import 'package:nova_task/core/widgets/list_header_widget.dart';
import 'package:nova_task/core/widgets/task_card_widget.dart';

import 'package:flutter/material.dart';
import 'package:nova_task/models/category_model.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(
          Dimens.pageMargin,
          0, // top
          Dimens.pageMargin,
          Dimens.pageMargin,
        ),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: Dimens.pageMargin.h),
                  // welcome message
                  const Text(AppStrings.welcomeGustUser),
                  SizedBox(height: (Dimens.small - 4).h),
                  Text(AppStrings.homeMessage, style: context.textTheme.bodySmall),
                  SizedBox(height: Dimens.medium.h),
                  // category list
                  SizedBox(
                    height: 230.h,
                    child: GetBuilder<CategoryController>(
                      init: CategoryController(),
                      builder: (controller) {
                        return ValueListenableBuilder<Box<CategoryModel>>(
                            valueListenable: controller.categoryBox.listenable(),
                          builder: (context, box, child) {
                              return GridView.builder(
                                itemCount: box.values.toList().take(4).length,
                                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  childAspectRatio: 1.3,
                                ),
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: EdgeInsets.only(right: Dimens.small.w, left: Dimens.small.w),
                                    child:  CategoryWidget(category: box.values.toList()[index]),
                                  );
                                },
                              );
                            },);
                      },
                    )
                  ),
                  SizedBox(height: Dimens.medium.h),
                  // today task list header
                  ListHeaderWidget(
                    title: AppStrings.todayTaskListHeader,
                    onPress: () {
                      Get.find<NavigationController>().changeIndex(1);
                    },
                  ),
                ],
              ),
            ),
            GetBuilder<MainController>(
              init: MainController(),
              builder: (controller) {
                return ValueListenableBuilder(
                  valueListenable: controller.taskBox.listenable(),
                  builder: (context, box, child) {
                    return SliverList(
                      delegate: SliverChildBuilderDelegate(
                            (BuildContext context, int index) {
                          return  Padding(
                            padding: const EdgeInsets.all(Dimens.small),
                            child: TaskCardWidget(task: box.values.toList()[index]),
                          );
                        },
                        childCount: box.values
                            .where((task) =>
                                task.date ==
                                "${Jalali.now().year}/${Jalali.now().month}/${Jalali.now().day}")
                            .toList()
                            .length,
                      ),
                    );
                  },);
              },
            ),
            SliverToBoxAdapter(
              child: SizedBox(height: 70.h),
            ),
          ],
        ),
      ),
    );
  }
}



