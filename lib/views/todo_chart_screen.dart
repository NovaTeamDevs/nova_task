import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nova_task/controllers/main_controller.dart';
import 'package:nova_task/core/resources/dimens.dart';
import 'package:nova_task/core/widgets/charts_task_widget.dart';

class TodoChartScreen extends StatelessWidget {
  const TodoChartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
      padding: const EdgeInsets.all(Dimens.pageMargin),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: GetBuilder<MainController>(
          builder: (controller) {
            return ChartsTaskWidget();
          }
        ),
      ),
    ));
  }
}


