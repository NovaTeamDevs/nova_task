import 'package:flutter/material.dart';
import 'package:nova_task/core/resources/dimens.dart';
import 'package:nova_task/core/widgets/search_text_field_widget.dart';

class TodoListScreen extends StatelessWidget {
  const TodoListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
        child: Padding(
          padding: EdgeInsets.all(Dimens.pageMargin),
          child: Column(
            children: [
              SearchTextFieldWidget()
            ],
          ),
        ));
  }
}
