
import 'package:get/get.dart';
import '../controllers/admin_inventory_controller.dart';


class AdminInventoryBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AdminInventoryController>(() => AdminInventoryController());
        // Get.put<AdminInventoryController>(AdminInventoryController());
  }
}