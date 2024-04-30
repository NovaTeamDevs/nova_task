import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nova_task/core/resources/app_strings.dart';
import 'package:nova_task/core/resources/dimens.dart';
import 'package:nova_task/core/widgets/category_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
          child: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // welcome message
                  Padding(
                    padding: const EdgeInsets.all(Dimens.pageMargin),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(AppStrings.welcomeGustUser),
                        SizedBox(height: (Dimens.small - 4).h),
                        Text(AppStrings.homeMessage,style: context.textTheme.bodySmall),
                        SizedBox(height: Dimens.medium.h),
                      ],
                    ),
                  ),
                  // category list
                  SizedBox(
                    height: 125.h,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          return  CategoryWidget(isFirst: index == 0);
                        },
                    ),
                  ),

                ],
              ),
            ),
          )
      ),
    );
  }
}


