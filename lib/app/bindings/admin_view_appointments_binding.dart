import 'package:get/get.dart';
import '../controllers/admin_view_appointments_controller.dart';

class AdminViewAppointmentsBinding implements Bindings {
  @override
  void dependencies() {
    // Get.lazyPut<AdminViewAppointmentsController>(
    //   () => AdminViewAppointmentsController(),
    //   fenix: true,
    // );
    Get.put<AdminViewAppointmentsController>(AdminViewAppointmentsController());
  }
}
