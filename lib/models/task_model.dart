import 'package:hive/hive.dart';
import 'package:nova_task/models/category_model.dart';

part 'task_model.g.dart';

@HiveType(typeId: 1)
class TaskModel extends HiveObject{
  @HiveField(0)
  final String? title;
  @HiveField(1)
  final String? description;
  @HiveField(2)
  final String? date;
  @HiveField(3)
  final CategoryModel? category;
  @HiveField(4)
  final bool? isDone;

  TaskModel({this.title, this.description, this.date, this.category, this.isDone});
}
