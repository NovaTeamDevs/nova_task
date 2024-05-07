import 'package:hive/hive.dart';
import 'package:nova_task/models/category_model.dart';

part 'task_model.g.dart';

@HiveType(typeId: 1)
class TaskModel extends HiveObject{
  @HiveField(0)
  String? title;
  @HiveField(1)
  String? description;
  @HiveField(2)
  String? date;
  @HiveField(3)
  CategoryModel? category;
  @HiveField(4)
  bool? isDone;

  TaskModel({this.title, this.description, this.date, this.category, this.isDone = false});
}
