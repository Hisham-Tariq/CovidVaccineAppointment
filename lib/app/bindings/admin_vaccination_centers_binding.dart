import 'package:get/get.dart';
import '../controllers/admin_vaccination_centers_controller.dart';

class AdminVaccinationCentersBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AdminVaccinationCentersController>(
      () => AdminVaccinationCentersController(),
      fenix: true,
    );
    // Get.put<AdminVaccinationCentersController>(AdminVaccinationCentersController());
  }
}
