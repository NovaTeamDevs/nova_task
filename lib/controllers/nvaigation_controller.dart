import 'package:get/get.dart';

class NavigationController extends GetxController {
  int selectedIndex = 0;

  void changeIndex(int newIndex) {
    selectedIndex = newIndex;
    update();
  }
}