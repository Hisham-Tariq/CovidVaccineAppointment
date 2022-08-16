
import 'package:get/get.dart';
import '../controllers/get_user_info_controller.dart';


class GetUserInfoBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GetUserInfoController>(() => GetUserInfoController());
        // Get.put<GetUserInfoController>(GetUserInfoController());
  }
}