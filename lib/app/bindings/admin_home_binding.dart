
import 'package:get/get.dart';
import '../controllers/admin_home_controller.dart';


class AdminHomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AdminHomeController>(() => AdminHomeController());
        // Get.put<AdminHomeController>(AdminHomeController());
  }
}