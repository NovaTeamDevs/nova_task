import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nova_task/controllers/task_controller.dart';
import 'package:nova_task/core/resources/app_strings.dart';
import 'package:nova_task/core/resources/dimens.dart';
import 'package:nova_task/core/widgets/app_button_widget.dart';
import 'package:nova_task/core/widgets/back_button_widget.dart';
import 'package:nova_task/core/widgets/select_category_button.dart';
import 'package:nova_task/core/widgets/selected_date_button.dart';
import 'package:nova_task/core/widgets/text_field_widget.dart';
import 'package:nova_task/models/task_model.dart';

class AddOrEditTaskScreen extends StatelessWidget {
  const AddOrEditTaskScreen({super.key, this.task});
  final TaskModel? task;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(Dimens.pageMargin),
          child: SingleChildScrollView(
            child: GetBuilder<TaskController>(
              init: TaskController(task),
              builder: (taskController) {
                return Column(
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
                    // forms
                    SizedBox(height: Dimens.medium.h),
                    Form(
                      key: taskController.formKey,
                        child: TextFieldWidget(
                            controller: taskController.titleText,
                            validator: taskController.validateTitle,
                            label: AppStrings.taskTitleLabel)
                    ),
                    SizedBox(height: Dimens.large.h),
                    const TextFieldWidget(label: AppStrings.taskDescription,maxLength: 24),
                    SizedBox(height: Dimens.large.h),
                    // set date
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                         Expanded(child: TextFieldWidget(
                            controller: taskController.dateText,
                            label: AppStrings.taskDateLabel,
                            readOnly: true,
                        )),
                        SizedBox(width: Dimens.medium.w,),
                        SelectedDateButton(
                          onTap: () => taskController.taskTimePicker(context),
                        ),
                      ],
                    ),
                    SizedBox(height: Dimens.large.h),
                    // select category
                    const SelectCategoryButton(),
                    SizedBox(height: (Dimens.large * 2).h),
                    // SAVE or EDIT Button
                    AppButtonWidget(
                      onTap: () => taskController.createOrUpdateTask(),
                      text: AppStrings.createTask,
                    )
                  ],
                );
              }
            ),
          ),
        ),
      ),
    );
  }
}


