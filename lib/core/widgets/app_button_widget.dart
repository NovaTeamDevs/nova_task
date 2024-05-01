import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nova_task/core/resources/dimens.dart';

class AppButtonWidget extends StatelessWidget {
  const AppButtonWidget({super.key, required this.text, required this.onTap});
  final String text;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(context.theme.colorScheme.primary),
        minimumSize: MaterialStatePropertyAll(Size(double.infinity,45.h)),
        shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(Dimens.medium.r)
            )
        )
      ),
        onPressed: onTap,
        child: Text(text,style: context.textTheme.titleLarge!.apply(color: Colors.white),));
  }
}
