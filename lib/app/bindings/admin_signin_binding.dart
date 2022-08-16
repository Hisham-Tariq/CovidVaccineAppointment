
import 'package:get/get.dart';
import '../controllers/admin_signin_controller.dart';


class AdminSigninBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AdminSigninController>(() => AdminSigninController());
        // Get.put<AdminSigninController>(AdminSigninController());
  }
}