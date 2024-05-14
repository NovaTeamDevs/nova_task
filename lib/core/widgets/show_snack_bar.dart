import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nova_task/core/resources/app_colors.dart';
import 'package:nova_task/core/resources/dimens.dart';

SnackbarController showSnackBar({required String title,required String message,SnackBarStatus status = SnackBarStatus.success}) {
  return Get.snackbar(
      '',
      '',
      titleText: Text(title,style: const TextStyle(color: Colors.white)),
      messageText: Text(message,style: const TextStyle(color: Colors.white)),
      backgroundColor: status == SnackBarStatus.success? AppColors.greenColor : AppColors.lightRedColor,
      snackPosition: SnackPosition.BOTTOM,
      margin: const EdgeInsets.all(Dimens.medium)
  );
}

enum SnackBarStatus {success,error}