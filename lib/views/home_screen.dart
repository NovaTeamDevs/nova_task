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

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: Dimens.pageMargin.h),
              // welcome message
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: Dimens.pageMargin),
                child: Text(AppStrings.welcomeGustUser),
              ),
              SizedBox(height: (Dimens.small - 4).h),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: Dimens.pageMargin),
                child: Text(AppStrings.homeMessage,style: context.textTheme.bodySmall),
              ),
              SizedBox(height: Dimens.medium.h),
              // category list
              SizedBox(
                height: 115.h,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return  CategoryWidget(isFirst: index == 0);
                    },
                ),
              ),
              // last added task And today task list
              SizedBox(height: Dimens.medium.h),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: Dimens.pageMargin),
                child: Text(AppStrings.lastAddedTask),
              ),
              SizedBox(height: Dimens.small.h),
              // last added task
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: Dimens.pageMargin),
                child: TaskCardWidget(),
              ),
              SizedBox(height: Dimens.medium.h),
              // today task list header
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: Dimens.pageMargin),
                child: ListHeaderWidget(
                  title: AppStrings.todayTaskListHeader,
                  onPress: () {},
                ),
              ),
              //today task list
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: Dimens.pageMargin),
                  itemCount: 20,
                  itemBuilder: (context, index) => const Padding(
                    padding: EdgeInsets.all(Dimens.small),
                    child: TaskCardWidget(),
                  ),
                ),
              ),
              SizedBox(height: 95.h,)
            ],
          )
      ),
    );
  }
}



