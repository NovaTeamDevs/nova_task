import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nova_task/core/resources/app_strings.dart';
import 'package:nova_task/core/resources/dimens.dart';

class AppChartWidget extends StatefulWidget {
  const AppChartWidget({super.key, required this.todoTaskValue, required this.endTaskValue});
  final double todoTaskValue;
  final double endTaskValue;

  @override
  State<AppChartWidget> createState() => _AppChartWidgetState();
}

class _AppChartWidgetState extends State<AppChartWidget> {
  final List<ChartData> chartData = [];
  @override
  void initState() {
    final List<ChartData> data = [
      ChartData(title: AppStrings.taskDone, color: const Color(0xFF8F99EB), value: widget.endTaskValue),
      ChartData(title: AppStrings.todoTask, color: const Color(0xFFE88B8C), value: widget.todoTaskValue),
    ];
    chartData.addAll(data);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // chart
        SizedBox(
          height: 200.h,
          child: PieChart(
              PieChartData(
                  borderData: FlBorderData(show: false),
                  sectionsSpace: 0,
                  centerSpaceRadius: 50.r,
                  sections: List.generate(chartData.length, (index) => PieChartSectionData(
                      title: "",
                      color: chartData[index].color,
                      value: chartData[index].value,
                  )
                  )
              )
          ),
        ),
        // information
        Column(
          children: List.generate(chartData.length, (index) {
            return Row(
              
              children: [
                Container(
                  width: 12.w,
                  height: 12.h,
                  margin: const EdgeInsets.all(Dimens.small - 4),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: chartData[index].color
                  ),
                ),
                Text(chartData[index].title,style: context.textTheme.bodySmall,),
                Spacer(),
                Text("${chartData[index].value.toInt()} وظیفه",style: context.textTheme.bodySmall,)
              ],
            ) ;
          }),
        )
      ],
    );
  }
}

class ChartData {

  final String title;
  final Color color;
  final double value;

  ChartData({required this.title,required this.color,required this.value});
}
