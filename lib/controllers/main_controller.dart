import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:nova_task/core/resources/storage_key.dart';
import 'package:nova_task/models/task_model.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';

class MainController extends GetxController {
//========================================= variables ==========================
final Box<TaskModel> taskBox = Hive.box(StorageKeys.taskBox);

  int? todayTaskDone;
  int? todayTaskNotDone;
  int? allTaskDone;
  int? allTaskNotDone;
  int totalTasks = 0;

  void calculateToDayTaskDone(){
    final todayDate = "${Jalali.now().year}/${Jalali.now().month}/${Jalali.now().day}";
    totalTasks = taskBox.values.toList().where((todo) => todo.date == todayDate).length;
    final taskList = taskBox.values.toList().where((todo) => todo.date == todayDate);
    int taskDone = 0;
    int taskNotDone = 0;
    for (var task in taskList) {
      if(task.isDone!){
        taskDone++;
      } else {
        taskNotDone++;
      }
    }
    todayTaskDone = taskDone;
    todayTaskNotDone = taskNotDone;
    update();
  }

  void calculateAllTaskDone(){
    totalTasks = taskBox.values.toList().length;
    int taskDone = 0;
    int taskNotDone = 0;
    for (var task in taskBox.values.toList()) {
      if(task.isDone!){
        taskDone++;
      } else {
        taskNotDone++;
      }
    }
    allTaskDone = taskDone;
    allTaskNotDone = taskNotDone;
    update();
  }


  @override
  void onInit() {
   calculateToDayTaskDone();
   calculateAllTaskDone();
    super.onInit();
  }

}