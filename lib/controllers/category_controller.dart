import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:nova_task/core/resources/app_strings.dart';
import 'package:nova_task/core/resources/storage_key.dart';
import 'package:nova_task/gen/assets.gen.dart';
import 'package:nova_task/models/category_model.dart';

class CategoryController extends GetxController {

//====================================== Variables =============================
  int selectedIcon = 0;
  String selectedIconPath = Assets.svgs.aperture;
  Color bgColor = const Color(0xff7dc8e7);
  final List iconList = [
    Assets.svgs.aperture,
    Assets.svgs.archive,
    Assets.svgs.atSign,
    Assets.svgs.bell,
    Assets.svgs.bookOpen,
    Assets.svgs.box,
    Assets.svgs.briefcase,
    Assets.svgs.chrome,
    Assets.svgs.clock,
    Assets.svgs.coffee,
    Assets.svgs.cpu,
    Assets.svgs.creditCard,
    Assets.svgs.delete,
    Assets.svgs.dollarSign,
    Assets.svgs.edit,
    Assets.svgs.eye,
    Assets.svgs.feather,
    Assets.svgs.figma,
    Assets.svgs.gitPullRequest,
    Assets.svgs.github,
    Assets.svgs.gitlab,
    Assets.svgs.globe,
    Assets.svgs.headphones,
    Assets.svgs.image,
    Assets.svgs.instagram,
    Assets.svgs.link,
    Assets.svgs.linkedin,
    Assets.svgs.lock,
    Assets.svgs.mapPin,
    Assets.svgs.music,
    Assets.svgs.pocket,
    Assets.svgs.qrcode,
    Assets.svgs.send,
    Assets.svgs.shoppingBag,
    Assets.svgs.slack,
    Assets.svgs.smile,
    Assets.svgs.speaker,
    Assets.svgs.star,
    Assets.svgs.target,
    Assets.svgs.thermometer,
    Assets.svgs.tool,
    Assets.svgs.truck,
    Assets.svgs.tv,
    Assets.svgs.twitch,
    Assets.svgs.twitter,
    Assets.svgs.watch,
    Assets.svgs.youtube
  ];
  final Box<CategoryModel> categoryBox = Hive.box(StorageKeys.categoryBox);
  final TextEditingController categoryText = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
//======================================= Methods ==============================
  void updateIcon(int newIconIndex,String newIcon) {
    selectedIcon = newIconIndex;
    selectedIconPath = newIcon;
    update();
  }
  // validate category title
  String? validateTitle(String? value) {
    if(value!.isEmpty) {
      return AppStrings.validateCategoryTitleMsg;
    }
    return null;
  }

  void onChangeColor(Color newColor) => bgColor = newColor;

  void createCategory(){
    if(formKey.currentState!.validate()){
      Get.back();
      final CategoryModel category = CategoryModel(
        title: categoryText.text,
        iconPath: selectedIconPath,
        bgColor: bgColor
      );
      categoryBox.add(category);
    }
  }

}