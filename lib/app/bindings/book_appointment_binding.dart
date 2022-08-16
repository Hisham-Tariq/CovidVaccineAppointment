
import 'package:get/get.dart';
import '../controllers/book_appointment_controller.dart';


class BookAppointmentBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BookAppointmentController>(() => BookAppointmentController());
        // Get.put<BookAppointmentController>(BookAppointmentController());
  }
}