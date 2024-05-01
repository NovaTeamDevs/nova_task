import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
              Expanded(
                  child: ListView.builder(
                    itemCount: 10,
                      itemBuilder: (context, index) => const Padding(
                        padding: EdgeInsets.all(Dimens.small),
                        child: TaskCardWidget(),
                      ),
                  ),
              ),
              SizedBox(height: (Dimens.large * 3).h,),
            ],
          ),
        ));
  }
}
