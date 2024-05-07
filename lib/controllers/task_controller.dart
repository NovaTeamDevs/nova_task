import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:nova_task/core/resources/app_strings.dart';
import 'package:nova_task/core/resources/storage_key.dart';
import 'package:nova_task/models/category_model.dart';
import 'package:nova_task/models/task_model.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';

class TaskController extends GetxController {
  TaskController(this.task);
  TaskModel? task;
//===================================== Variable ===============================
  final TextEditingController titleText = TextEditingController();
  final TextEditingController descriptionText = TextEditingController();
  final TextEditingController dateText = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final Box<TaskModel> taskBox = Hive.box(StorageKeys.taskBox);
  final Box<CategoryModel> categoryBoxBox = Hive.box(StorageKeys.categoryBox);
  CategoryModel? category;
  int? selectedCategoryIndex;


//===================================== Methods ================================

  //set time
  Future<void> taskTimePicker(BuildContext context) async {
    var time = await showPersianDatePicker(
      context: context,
      initialDate: Jalali.now(),
      firstDate: Jalali(1403,1,1),
      lastDate: Jalali(1490,1,1),);
    var year = time?.year.toString();
    var month = time?.month.toString().length == 1 ? "0${time?.month}" : time?.month.toString();
    var day = time?.year.toString().length == 1 ? "0${time?.day}" : time?.day.toString();
    var finalTime = "$year/$month/$day";
    dateText.text = finalTime;
    update();
  }
  // select category
  void updateCategory(int newIndex,CategoryModel newCategory) {
    Get.back();
    selectedCategoryIndex = newIndex;
    category = newCategory;
    update();
  }
  // validate task title
  String? validateTitle(String? value) {
    if(value!.isEmpty) {
      return AppStrings.validateCategoryTitleMsg;
    }
    return null;
  }
  // create task
  void createOrUpdateTask() async {
    if(formKey.currentState!.validate()){

        if(task == null){
          if(category == null) {
            print("please select category...");
          }
         _addNewTask();
        } else {
          _updateTask();
        }

    }
  }
  // update task
  void _updateTask() {
    Get.back();
    task?.title = titleText.text;
    task?.description = descriptionText.text;
    task?.date = dateText.text;
    if(category != null){
      task?.category = category;
    }
    task?.save();
  }
  // add new task
  void _addNewTask() async {
    Get.back();
    task = TaskModel(
        title: titleText.text,
        description: descriptionText.text,
        date: dateText.text,
        category: category
    );
    await taskBox.add(task!);
  }
  // initial forms for update
  void _initialFormsForUpdate() {
    if(task != null) {
      titleText.text =   task!.title!;
      descriptionText.text = task?.description ?? '';
      dateText.text = task!.date!;
    }
  }

  @override
  void onInit() {
    if(task == null) {
      dateText.text = "${Jalali.now().year}/${Jalali.now().month}/${Jalali.now().day}";
    } else {
      _initialFormsForUpdate();
    }
    super.onInit();
  }
}