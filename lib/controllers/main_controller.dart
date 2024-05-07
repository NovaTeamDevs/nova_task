import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:nova_task/core/resources/storage_key.dart';
import 'package:nova_task/models/task_model.dart';

class MainController extends GetxController {
//========================================= variables ==========================
final Box<TaskModel> taskBox = Hive.box(StorageKeys.taskBox);
}