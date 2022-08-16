import 'package:covid_app/app/controllers/controllers.dart';
import 'package:covid_app/app/data/models/user_model/user_model.dart';
import 'package:covid_app/app/routes/app_routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class AdminSigninController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // void createAdmin() async {
  //   UserCredential userCredential =
  //       await FirebaseAuth.instance.createUserWithEmailAndPassword(
  //     email: emailController.text,
  //     password: passwordController.text,
  //   );
  //   var controller = Get.find<UserController>();
  //   controller.user = UserModel(
  //     address: '',
  //     dob: '',
  //     email: emailController.text,
  //     firstName: '',
  //     lastName: '',
  //     nid: '',
  //     photoUrl: '',
  //   );
  //   await controller.createNewUser();
  // }

  String? validateEmail(String? email) {
    if (!GetUtils.isEmail(email!)) {
      return 'Invalid Email';
    }
  }

  String? validatePassword(String? password) {
    if (password!.isEmpty) {
      return 'Invalid Password';
    }
  }

  signInAdmin() async {
    if (!formKey.currentState!.validate()) return;
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      Get.offAllNamed(AppRoutes.ADMIN_HOME);
      Fluttertoast.showToast(msg: 'Signed In Successfully');
    } catch (e) {
      Fluttertoast.showToast(msg: 'Failed');
    }
  }
}
