
import 'package:get/get.dart';
import '../controllers/generate_certificate_controller.dart';


class GenerateCertificateBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GenerateCertificateController>(() => GenerateCertificateController());
        // Get.put<GenerateCertificateController>(GenerateCertificateController());
  }
}