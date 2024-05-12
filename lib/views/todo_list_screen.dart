import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:nova_task/controllers/main_controller.dart';
import 'package:nova_task/core/resources/dimens.dart';
import 'package:nova_task/core/widgets/search_text_field_widget.dart';
import 'package:nova_task/core/widgets/task_card_widget.dart';
import 'package:nova_task/models/task_model.dart';

class TodoListScreen extends StatelessWidget {
  const TodoListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(Dimens.pageMargin),
          child: GetBuilder<MainController>(
            builder: (controller) {
              return Column(
                children: [
                  SearchTextFieldWidget(
                      controller: controller.searchText,
                      onChange: (value) => controller.searchTask(value),
                  ),
                  SizedBox(height: Dimens.large.h,),
                  Expanded(
                      child: ValueListenableBuilder(
                        valueListenable: controller.taskBox.listenable(),
                        builder: (context, box, child) {
                          final List<TaskModel> taskList;
                          if(controller.searchKeyWord == '' || controller.searchKeyWord == null) {
                            taskList = box.values.toList();
                          } else {
                            taskList = box.values.where((items) => items.title!.contains(controller.searchKeyWord!)).toList();
                          }
                          return ListView.builder(
                            itemCount: taskList.length,
                            itemBuilder: (context, index) =>  Padding(
                              padding: const EdgeInsets.all(Dimens.small),
                              child: TaskCardWidget(task: taskList[index]),
                            ),
                          );
                        },
                      )
                  ),
                  SizedBox(height: (Dimens.large * 3).h,),
                ],
              );
            }
          ),
        ));
  }
}
