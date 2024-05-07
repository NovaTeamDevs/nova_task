import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:nova_task/core/resources/app_colors.dart';
import 'package:nova_task/core/resources/storage_key.dart';
import 'package:nova_task/gen/assets.gen.dart';
import 'package:nova_task/models/category_model.dart';
import 'package:nova_task/views/main_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashController extends GetxController {
  final Box<CategoryModel> categoryBox = Hive.box(StorageKeys.categoryBox);
  final List<CategoryModel> _defaultCategoryList = [
    CategoryModel(title: "کارهای روزانه",bgColor: AppColors.blueColor,iconPath: Assets.svgs.coffee),
    CategoryModel(title: "قرار های ملاقات",bgColor: AppColors.purpleColor,iconPath: Assets.svgs.clock),
    CategoryModel(title: "اهداف روزانه",bgColor: AppColors.lightRedColor,iconPath: Assets.svgs.target),
    CategoryModel(title: "کارهای خصوصی",bgColor: AppColors.greenColor,iconPath: Assets.svgs.lock),
  ];
  void _navigateToMainScreen() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if(prefs.getBool(StorageKeys.isFirst) == null) {
      await categoryBox.addAll(_defaultCategoryList);
      await prefs.setBool(StorageKeys.isFirst, false);
    }
    await Future.delayed(3.seconds);
    Get.offAll(const MainScreen());
  }

  @override
  void onInit() {
    _navigateToMainScreen();
    super.onInit();
  }
}