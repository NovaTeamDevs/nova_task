import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:nova_task/controllers/main_controller.dart';
import 'package:nova_task/core/resources/dimens.dart';
import 'package:nova_task/core/widgets/search_text_field_widget.dart';
import 'package:nova_task/core/widgets/task_card_widget.dart';

class TodoListScreen extends StatelessWidget {
  const TodoListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(Dimens.pageMargin),
          child: Column(
            children: [
              const SearchTextFieldWidget(),
              SizedBox(height: Dimens.large.h,),
              GetBuilder<MainController>(
                builder: (controller) {
                  return Expanded(
                      child: ValueListenableBuilder(
                        valueListenable: controller.taskBox.listenable(),
                         builder: (context, box, child) {
                           return ListView.builder(
                             itemCount: box.values.toList().length,
                             itemBuilder: (context, index) =>  Padding(
                               padding: const EdgeInsets.all(Dimens.small),
                               child: TaskCardWidget(task: box.values.toList()[index]),
                             ),
                           );
                         },
                      )
                  );
                }
              ),
              SizedBox(height: (Dimens.large * 3).h,),
            ],
          ),
        ));
  }
}
