
import 'package:get/get.dart';
import '../controllers/nurse_home_controller.dart';


class NurseHomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NurseHomeController>(() => NurseHomeController());
        // Get.put<NurseHomeController>(NurseHomeController());
  }
}