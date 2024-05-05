import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nova_task/core/resources/app_strings.dart';
import 'package:nova_task/core/resources/dimens.dart';
import 'package:nova_task/core/widgets/category_widget.dart';
import 'package:nova_task/core/widgets/list_header_widget.dart';
import 'package:nova_task/core/widgets/task_card_widget.dart';

import 'package:flutter/material.dart';

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
                    child: GridView.builder(
                      itemCount: 4,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 1.3,
                      ),
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.only(right: Dimens.small.w, left: Dimens.small.w),
                          child: const CategoryWidget(),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: Dimens.medium.h),
                  // today task list header
                  ListHeaderWidget(
                    title: AppStrings.todayTaskListHeader,
                    onPress: () {},
                  ),
                ],
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                  return const Padding(
                    padding: EdgeInsets.all(Dimens.small),
                    child: TaskCardWidget(),
                  );
                },
                childCount: 20,
              ),
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



