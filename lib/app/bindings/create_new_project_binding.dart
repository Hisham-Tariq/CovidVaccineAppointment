
import 'package:get/get.dart';
import '../controllers/create_new_project_controller.dart';


class CreateNewProjectBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CreateNewProjectController>(() => CreateNewProjectController());
        // Get.put<CreateNewProjectController>(CreateNewProjectController());
  }
}