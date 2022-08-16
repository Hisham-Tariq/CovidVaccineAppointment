
import 'package:get/get.dart';
import '../controllers/nurse_signin_controller.dart';


class NurseSigninBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NurseSigninController>(() => NurseSigninController());
        // Get.put<NurseSigninController>(NurseSigninController());
  }
}