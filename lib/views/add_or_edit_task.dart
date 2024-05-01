import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nova_task/core/resources/app_strings.dart';
import 'package:nova_task/core/resources/dimens.dart';
import 'package:nova_task/core/widgets/back_button_widget.dart';
import 'package:nova_task/core/widgets/selected_date_button.dart';
import 'package:nova_task/core/widgets/text_field_widget.dart';

class AddOrEditTaskScreen extends StatelessWidget {
  const AddOrEditTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(Dimens.pageMargin),
          child: SingleChildScrollView(
            child: Column(
              children: [
                // app bar
                Row(
                  children: [
                    const Spacer(),
                    Text(AppStrings.addTask,style: context.textTheme.titleMedium),
                    const Spacer(),
                    const BackButtonWidget()
                  ],
                ),
                const TextFieldWidget(label: AppStrings.taskTitleLabel),
                const TextFieldWidget(label: AppStrings.taskDescription,maxLength: 24),
                // set date
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Expanded(child: TextFieldWidget(label: AppStrings.taskDateLabel)),
                    SizedBox(width: Dimens.medium.w,),
                    SelectedDateButton(),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}



