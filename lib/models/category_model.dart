import 'dart:ui';

import 'package:hive/hive.dart';

part 'category_model.g.dart';

@HiveType(typeId: 0)
class CategoryModel extends HiveObject{
  @HiveField(0)
  final String? iconPath;
  @HiveField(1)
  final String? title;
  @HiveField(2)
  final Color? bgColor;

  CategoryModel({this.iconPath, this.title, this.bgColor});
}