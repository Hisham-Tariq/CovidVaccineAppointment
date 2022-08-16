import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import '../routes/app_routes.dart';
import 'user_controller.dart';

class SplashController extends GetxController {
  final _auth = FirebaseAuth.instance;

  start() {
    Future.delayed(const Duration(seconds: 2)).then((value) async {
      if (isUserLoggedIn) {
        if (_auth.currentUser!.email == "covidvaccine@admin.com") {
          Get.offAllNamed(AppRoutes.ADMIN_HOME);
          return;
        } else if (_auth.currentUser!.email == "covidvaccine@nurse.com") {
          Get.offAllNamed(AppRoutes.NURSE_HOME);
          return;
        }
        var controller = Get.find<UserController>();
        var isNewUser = await controller.isNewUser(_auth.currentUser!.uid);
        isNewUser.printInfo();
        if (isNewUser) {
          Get.offAllNamed(AppRoutes.GET_USER_INFO);
        } else {
          Get.find<UserController>()
              .readUserDataById(FirebaseAuth.instance.currentUser!.uid)
              .then((value) {
            Get.offAllNamed(AppRoutes.HOME);
          });
        }
      } else {
        Get.offAllNamed(AppRoutes.INTRODUCTION);
      }
    });
  }

  @override
  void onInit() async {
    super.onInit();
    var status = await Permission.storage.status;

    if (!status.isGranted) {
      await Permission.storage.request().then((value) {
        if (value.isGranted) {
          start();
        }
      });
    } else {
      start();
    }
  }

  bool get isUserLoggedIn => _auth.currentUser != null;
}
