import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';

class TaskController extends GetxController {
//===================================== Variable ===============================
  final TextEditingController titleText = TextEditingController();
  final TextEditingController descriptionText = TextEditingController();
  final TextEditingController dateText = TextEditingController();


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


  @override
  void onInit() {
    dateText.text = "${Jalali.now().year}/${Jalali.now().month}/${Jalali.now().day}";
    super.onInit();
  }
}