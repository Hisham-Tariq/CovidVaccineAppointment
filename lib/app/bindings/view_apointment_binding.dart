
import 'package:get/get.dart';
import '../controllers/view_apointment_controller.dart';


class ViewApointmentBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ViewApointmentController>(() => ViewApointmentController());
        // Get.put<ViewApointmentController>(ViewApointmentController());
  }
}