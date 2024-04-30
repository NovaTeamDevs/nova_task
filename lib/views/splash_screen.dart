import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:nova_task/controllers/splash_controller.dart';
import 'package:nova_task/core/resources/app_strings.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  GetBuilder(
      init: SplashController(),
      builder: (controller) {
        return Scaffold(
          body: SafeArea(
            child: SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  // app name and loading
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(AppStrings.appName,style: context.theme.textTheme.titleMedium!.copyWith(fontSize: 24)),
                      LoadingAnimationWidget.flickr(
                        size: 48,
                        leftDotColor: Colors.black,
                        rightDotColor: Colors.amber,
                      ),
                    ],
                  ),
                  // app version text
                  Positioned(
                      bottom: 12.h,
                      child: const Text(AppStrings.appVersion))
                ],
              ),
            ),
          ),
        );
      }
    );
  }
}
