import 'package:get/get.dart';
import '../controllers/theme_controller.dart';

class AppBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<ThemeController>(ThemeController(), permanent: true);
  }
}
