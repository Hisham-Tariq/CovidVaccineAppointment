import '../../controllers/controllers.dart';
import 'package:get/get.dart';

class DependecyInjection {
  static void init() {
    // Get.put<NavigationController>(NavigationController());
    // Get.put<MainController>(MainController());
    Get.put<ThemeController>(ThemeController());
    Get.put<UserController>(UserController(), permanent: true);
  }
}
