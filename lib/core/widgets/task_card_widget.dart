import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nova_task/core/resources/dimens.dart';
import 'package:nova_task/core/widgets/task_option_bottom_sheet_widget.dart';
import 'package:nova_task/models/task_model.dart';

class TaskCardWidget extends StatelessWidget {
  const TaskCardWidget({
    super.key, required this.task,
  });
  final TaskModel task;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(Dimens.medium),
      width: double.infinity,
      height: 90.h,
      decoration: BoxDecoration(
          color: task.category!.bgColor!.withOpacity(0.10),
          borderRadius: BorderRadius.circular(Dimens.medium.r)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // title and description
          Row(
            children: [
              Text(task.title!,style: context.textTheme.titleMedium!.apply(
                  decoration: task.isDone!? TextDecoration.lineThrough : TextDecoration.none
              )),
              const Spacer(),
              InkWell(
                onTap: () => showModalBottomSheet(context: context, builder: (context) =>  TaskOptionBottomSheetWidget(task: task)),
                  child: const Icon(Icons.more_vert))
            ],
          ),
          SizedBox(height: (Dimens.small - 4).h),
          Text(task.description ?? "",style: context.textTheme.bodySmall!.apply(
              decoration: task.isDone!? TextDecoration.lineThrough : TextDecoration.none
          )),
          SizedBox(height: Dimens.medium.h),
          // category name
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              width: 75.w,
              height: 20.h,
              decoration: BoxDecoration(
                  color: task.category!.bgColor!.withOpacity(0.20),
                  borderRadius: BorderRadius.circular(Dimens.small.r)
              ),
              child: Center(child: Text("دسته بندی",style: context.textTheme.bodyMedium!.copyWith(
                  color: task.category!.bgColor!
              ),)),
            ),
          )
        ],
      ),
    );
  }
}