import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nova_task/core/resources/app_strings.dart';
import 'package:nova_task/core/resources/dimens.dart';
import 'package:nova_task/core/widgets/category_widget.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(Dimens.pageMargin),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //user avatar holder
              Container(
                width: 80.w,
                height: 80.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: context.theme.colorScheme.shadow,
                      blurRadius: 15,
                      offset: const Offset(-3,7)
                    )
                  ]
                ),
              ),
              // username and change username
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(AppStrings.gustUsername,style: context.textTheme.titleMedium),
                  IconButton(onPressed: (){}, icon: const Icon(Icons.edit),iconSize: 16,)
                ],
              ),
              // category list
              Expanded(
                  child: GridView.builder(
                    physics: const BouncingScrollPhysics(),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                         mainAxisExtent: 160
                      ),
                      itemCount: 10,
                      itemBuilder: (context, index) {
                      if(index == 0) {
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            DottedBorder(
                              borderType: BorderType.RRect,
                              radius: Radius.circular(Dimens.medium.r),
                              color: const Color(0xFFC6CEDD),
                              child: SizedBox(
                                width: 150.w,
                                height: 110.h,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(Icons.category_sharp,size: 64,color: Color(0xFFC6CEDD)),
                                    SizedBox(height: Dimens.small.h),
                                    const Text(AppStrings.createNewCategory)
                                  ],
                                ),
                              ),
                            ),
                          ],
                        );
                      } else {
                        return  const CategoryWidget();
                      }

                      },)),
              SizedBox(height: (Dimens.large * 3).h,),
            ],
          ),
        ),
      ),
    );
  }
}
