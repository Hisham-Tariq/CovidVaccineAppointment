import 'package:covid_app/app/routes/app_routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class NurseSigninController extends GetxController {
  final passwordController = TextEditingController();

  var emailController = TextEditingController();

  final formKey = GlobalKey<FormState>();
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

  signInNurse() async {
    if (!formKey.currentState!.validate()) return;
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      Get.offAllNamed(AppRoutes.NURSE_HOME);
      Fluttertoast.showToast(msg: 'Signed In Successfully');
    } catch (e) {
      Fluttertoast.showToast(msg: 'Failed');
    }
  }
}
