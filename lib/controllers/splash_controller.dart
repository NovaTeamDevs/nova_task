import 'package:get/get.dart';
import 'package:nova_task/views/home_screen.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    Future.delayed(3.seconds).then((value) {
      Get.offAll(const HomeScreen());
    });
    super.onInit();
  }
}