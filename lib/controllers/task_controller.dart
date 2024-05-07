import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:nova_task/core/resources/storage_key.dart';
import 'package:nova_task/models/category_model.dart';
import 'package:nova_task/models/task_model.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';

class TaskController extends GetxController {
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

  @override
  void onInit() {
    dateText.text = "${Jalali.now().year}/${Jalali.now().month}/${Jalali.now().day}";
    super.onInit();
  }
}