import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nova_task/core/resources/app_strings.dart';
import 'package:nova_task/core/resources/dimens.dart';
import 'package:nova_task/models/task_model.dart';
import 'package:nova_task/views/add_or_edit_task.dart';

class TaskOptionBottomSheetWidget extends StatelessWidget {
  const TaskOptionBottomSheetWidget({super.key, required this.task});
  final TaskModel task;
  @override
  Widget build(BuildContext context) {
    final options = [
      _TaskOptionItem(onTap: () {
        Get.back();
        task.isDone = !task.isDone!;
        task.save();
      }, title: task.isDone! ? AppStrings.changeStatusTodo :AppStrings.changeStatusToDone, icon: Icons.checklist_outlined),
      _TaskOptionItem(onTap: () {
        Get.to(AddOrEditTaskScreen(task: task));
      }, title: AppStrings.editTask, icon: Icons.edit),
      _TaskOptionItem(onTap: () {
        Get.back();
        task.delete();
      }, title: AppStrings.removeTask, icon: Icons.delete_forever),
    ];
    return Padding(
      padding: const EdgeInsets.all(Dimens.pageMargin),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(options.length, (index) => _TaskOptionItem(
            onTap: options[index].onTap,
            title: options[index].title,
            icon: options[index].icon))
      ),
    );
  }
}

class _TaskOptionItem extends StatelessWidget {
  const _TaskOptionItem({
    super.key, required this.onTap, required this.title, required this.icon,
  });
  final VoidCallback onTap;
  final String title;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      title: Text(title),
      leading: Icon(icon),
    );
  }
}
